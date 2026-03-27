const { Pool } = require("@neondatabase/serverless");
const bcrypt = require("bcrypt");

async function seedPassword() {
  const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
  });

  try {
    const client = await pool.connect();

    // Hash the password with bcrypt (salt rounds = 10)
    const plainPassword = "wada@2025";
    const hashedPassword = await bcrypt.hash(plainPassword, 10);

    // Upsert the admin user
    const result = await client.query(
      `INSERT INTO users (username, password, created_at, updated_at)
       VALUES ($1, $2, NOW(), NOW())
       ON CONFLICT (username) DO UPDATE SET 
         password = $2,
         updated_at = NOW()
       RETURNING id, username, created_at, updated_at`,
      ["admin", hashedPassword]
    );

    console.log("✓ System password seeded successfully");
    console.log(`  Username: admin`);
    console.log(`  Password: ${plainPassword} (hashed in database)`);
    console.log(`  User ID: ${result.rows[0].id}`);
    console.log(`  Created/Updated: ${result.rows[0].updated_at}`);

    client.release();
  } catch (error) {
    console.error("✗ Error seeding password:", error.message);
    process.exit(1);
  } finally {
    await pool.end();
  }
}

seedPassword();
