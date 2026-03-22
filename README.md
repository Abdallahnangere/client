# Capital Management System

A professional private fund management and ledger system — built to JP Morgan standards of clarity and precision.

**Stack:** Next.js 14 (App Router) · TypeScript · Neon PostgreSQL · Tailwind CSS · Vercel

---

## Features

- **Dashboard** — real-time fund overview: total inflow, outflow, net position, client exposures
- **Client Registry** — full CRUD on client profiles with bank account notes
- **Ledger per Client** — chronological transaction history grouped by month with running balances
- **Master Ledger** — all transactions across all clients in one view
- **Record Debit** — log money paid OUT from the fund (to or for a client)
- **Record Credit** — log money received INTO the fund (from a client)
- **Delete Transactions** — remove incorrect entries with confirmation
- **Responsive UI** — works on mobile, tablet, and desktop
- Dark luxury aesthetic — deep navy + gold, IBM Plex Mono for numbers

---

## Ledger Logic

```
DEBIT  = Wada is the SENDER  → fund is paying out to / for the client
CREDIT = Wada is the RECEIVER → money is coming INTO the fund from the client
```

The `person_balance_summary` view tracks per-client:
- `total_inflow` — what clients have paid into the fund
- `total_outflow` — what the fund has paid out to/for clients
- `net_balance` — positive = client owes fund; negative = fund owes client
- `deficit` — how much more the fund has paid out than received

---

## Quick Start

### 1. Clone & Install

```bash
git clone https://github.com/your-username/capital-management.git
cd capital-management
npm install
```

### 2. Create Neon Database

1. Go to [neon.tech](https://neon.tech) → create a new project
2. Copy the **connection string** from Dashboard → Connection Details
3. It looks like: `postgresql://user:pass@ep-xxx.us-east-2.aws.neon.tech/dbname?sslmode=require`

### 3. Environment Variables

```bash
cp .env.local.example .env.local
```

Edit `.env.local`:
```env
DATABASE_URL="postgresql://user:pass@ep-xxx.us-east-2.aws.neon.tech/dbname?sslmode=require"
```

### 4. Seed the Database

This creates the tables, view, and seeds all 20 transactions:

```bash
npm run db:seed
```

Expected output:
```
🌱 Starting seed...
✅ persons table ready
✅ transactions table ready
✅ Seeded: Said Abdullahi Abdulmudallib
✅ Seeded 20 transactions for Said
✅ View person_balance_summary ready
🎉 Seed complete!
```

### 5. Run Locally

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

---

## Deployment on Vercel

### Option A — GitHub Integration (Recommended)

1. Push code to a GitHub repo
2. Go to [vercel.com](https://vercel.com) → New Project → Import the repo
3. In **Environment Variables**, add:
   ```
   DATABASE_URL = postgresql://user:pass@ep-xxx...neon.tech/dbname?sslmode=require
   ```
4. Click **Deploy**

### Option B — Vercel CLI

```bash
npm install -g vercel
vercel login
vercel

# Set env var
vercel env add DATABASE_URL production
# Paste your DATABASE_URL when prompted

vercel --prod
```

---

## Database Schema

### `persons`
| Column | Type | Notes |
|---|---|---|
| id | SERIAL PK | |
| full_name | VARCHAR(150) | Stored in uppercase |
| phone | VARCHAR(30) | Optional |
| email | VARCHAR(150) | Optional |
| notes | TEXT | Bank account numbers, etc. |
| created_at | TIMESTAMPTZ | Auto-set |

### `transactions`
| Column | Type | Notes |
|---|---|---|
| id | SERIAL PK | |
| person_id | INTEGER FK | References persons(id) CASCADE |
| type | VARCHAR(10) | `CREDIT` or `DEBIT` |
| amount | NUMERIC(15,2) | In NGN |
| sender | VARCHAR(150) | Physical sender |
| receiver | VARCHAR(150) | Physical receiver |
| transaction_date | TIMESTAMPTZ | Actual date of transaction |
| bank | VARCHAR(100) | e.g. `TAJBank → OPay` |
| reference_number | VARCHAR(120) | Bank reference / session ID |
| status | VARCHAR(20) | `SUCCESSFUL`, `PENDING`, etc. |
| note | TEXT | Additional context |
| created_at | TIMESTAMPTZ | Auto-set |

### `person_balance_summary` (view)
Aggregated per-client balance: inflow, outflow, net, surplus, deficit, margin %, counts.

---

## API Reference

### Persons
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/persons` | List all clients |
| `POST` | `/api/persons` | Create new client |
| `GET` | `/api/persons/:id` | Get client by ID |
| `PUT` | `/api/persons/:id` | Update client |
| `DELETE` | `/api/persons/:id` | Delete client (cascades transactions) |

### Transactions
| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/transactions` | Record new transaction |
| `DELETE` | `/api/transactions/:id` | Delete transaction |

---

## Project Structure

```
capital-management/
├── app/
│   ├── layout.tsx              # Root layout with sidebar
│   ├── page.tsx                # Dashboard / overview
│   ├── loading.tsx             # Global loading skeleton
│   ├── error.tsx               # Error boundary
│   ├── not-found.tsx           # 404 page
│   ├── globals.css             # Global styles & design tokens
│   ├── ledger/
│   │   └── page.tsx            # Master ledger (all transactions)
│   ├── persons/
│   │   ├── page.tsx            # Client directory
│   │   ├── new/page.tsx        # Add new client
│   │   └── [id]/
│   │       ├── page.tsx        # Client detail + ledger
│   │       ├── TransactionActions.tsx  # Credit/debit modals
│   │       └── edit/page.tsx   # Edit client profile
│   └── api/
│       ├── persons/
│       │   ├── route.ts        # GET list, POST create
│       │   └── [id]/route.ts   # GET, PUT, DELETE by id
│       └── transactions/
│           ├── route.ts        # POST create
│           └── [id]/route.ts   # DELETE by id
├── components/
│   ├── layout/
│   │   └── Sidebar.tsx         # Navigation sidebar
│   └── ui/
│       └── index.tsx           # Shared UI components
├── lib/
│   ├── db.ts                   # Neon DB connection + all queries
│   └── utils.ts                # Formatting helpers
├── scripts/
│   └── seed.js                 # Database seeding script
├── .env.local.example
├── .gitignore
├── next.config.js
├── tailwind.config.js
├── tsconfig.json
└── README.md
```

---

## Adding More Clients

From the **Client Directory** page, click **Add Client** and fill in:
- Full Name (auto-uppercased, as on bank documents)
- Phone number
- Email address
- Notes (paste bank account numbers here for easy reference)

Then go to the client's ledger page to record debits and credits.

---

## Security Notes

- This system has **no authentication** by default — only deploy on a trusted network or add middleware
- Add Vercel Password Protection or implement NextAuth for proper access control
- The `robots.txt` disallows all crawlers; keep the system private
- Never commit `.env.local` — it is in `.gitignore`

---

## License

Private — for internal use only.
