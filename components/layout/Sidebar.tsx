"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState } from "react";
import { cn } from "@/lib/utils";

const navItems = [
  {
    href: "/",
    label: "Overview",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <rect x="1" y="1" width="6" height="6" rx="1" stroke="currentColor" strokeWidth="1.3" />
        <rect x="9" y="1" width="6" height="6" rx="1" stroke="currentColor" strokeWidth="1.3" />
        <rect x="1" y="9" width="6" height="6" rx="1" stroke="currentColor" strokeWidth="1.3" />
        <rect x="9" y="9" width="6" height="6" rx="1" stroke="currentColor" strokeWidth="1.3" />
      </svg>
    ),
  },
  {
    href: "/persons",
    label: "Clients",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="5" r="2.5" stroke="currentColor" strokeWidth="1.3" />
        <path d="M2.5 13.5C2.5 11.015 5.015 9 8 9s5.5 2.015 5.5 4.5" stroke="currentColor" strokeWidth="1.3" strokeLinecap="round" />
      </svg>
    ),
  },
  {
    href: "/ledger",
    label: "Ledger",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <rect x="2" y="1.5" width="12" height="13" rx="1" stroke="currentColor" strokeWidth="1.3" />
        <path d="M5 5.5h6M5 8h6M5 10.5h4" stroke="currentColor" strokeWidth="1.3" strokeLinecap="round" />
      </svg>
    ),
  },
  {
    href: "/summary",
    label: "Summary",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <rect x="1" y="3" width="14" height="10" rx="1" stroke="currentColor" strokeWidth="1.3" />
        <path d="M1 6h14M5 6v7" stroke="currentColor" strokeWidth="1.3" />
      </svg>
    ),
  },
];

export default function Sidebar() {
  const pathname = usePathname();
  const [mobileOpen, setMobileOpen] = useState(false);

  const isActive = (href: string) => {
    if (href === "/") return pathname === "/";
    return pathname.startsWith(href);
  };

  return (
    <>
      {/* Mobile toggle */}
      <button
        onClick={() => setMobileOpen(!mobileOpen)}
        className="lg:hidden fixed top-4 left-4 z-50 p-2 rounded-lg"
        style={{ background: "var(--sb-bg)", border: "1px solid var(--sb-border)", color: "var(--sb-text-2)" }}
        aria-label="Toggle menu"
      >
        {mobileOpen ? (
          <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
            <path d="M3 3l12 12M15 3L3 15" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
          </svg>
        ) : (
          <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
            <path d="M2.5 5h13M2.5 9h13M2.5 13h13" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
          </svg>
        )}
      </button>

      {/* Overlay */}
      {mobileOpen && (
        <div
          className="lg:hidden fixed inset-0 z-40"
          style={{ background: "rgba(13,20,33,.5)", backdropFilter: "blur(2px)" }}
          onClick={() => setMobileOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={cn(
          "fixed left-0 top-0 h-screen w-64 z-40 flex flex-col",
          "transition-transform duration-250 ease-in-out",
          "lg:translate-x-0",
          mobileOpen ? "translate-x-0" : "-translate-x-full"
        )}
        style={{
          background: "var(--sb-bg)",
          borderRight: "1px solid var(--sb-border)",
        }}
      >
        {/* Logo / Brand */}
        <div className="px-5 pt-7 pb-5" style={{ borderBottom: "1px solid var(--sb-border)" }}>
          <div className="flex items-center gap-3">
            <div
              className="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0"
              style={{ background: "var(--brand)", boxShadow: "0 2px 8px rgba(27,79,216,.4)" }}
            >
              <span className="text-[11px] font-bold text-white tracking-wide">CM</span>
            </div>
            <div>
              <p className="text-[13px] font-semibold" style={{ color: "var(--sb-text-2)", letterSpacing: "0.01em" }}>
                Capital Mgmt
              </p>
              <p className="text-[10px] tracking-widest uppercase mt-0.5" style={{ color: "var(--sb-text)", opacity: .7 }}>
                Private Fund
              </p>
            </div>
          </div>
        </div>

        {/* Navigation */}
        <nav className="flex-1 px-3 py-5 space-y-0.5">
          <p className="px-3 mb-3 text-[9px] font-bold tracking-widest uppercase" style={{ color: "var(--sb-text)", opacity: .5 }}>
            Navigation
          </p>
          {navItems.map((item) => {
            const active = isActive(item.href);
            return (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => setMobileOpen(false)}
                className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm transition-all duration-150"
                style={{
                  background: active ? "var(--sb-active-bg)" : "transparent",
                  color: active ? "var(--sb-active-text)" : "var(--sb-text)",
                  fontWeight: active ? 600 : 400,
                }}
              >
                <span style={{ color: active ? "var(--brand-mid)" : "var(--sb-text)", opacity: active ? 1 : .7 }}>
                  {item.icon}
                </span>
                <span>{item.label}</span>
                {active && (
                  <span
                    className="ml-auto w-1.5 h-4 rounded-full"
                    style={{ background: "var(--brand-mid)" }}
                  />
                )}
              </Link>
            );
          })}
        </nav>

        {/* Footer */}
        <div className="px-5 py-4" style={{ borderTop: "1px solid var(--sb-border)" }}>
          <p className="text-[9px] font-semibold tracking-widest uppercase" style={{ color: "var(--sb-text)", opacity: .5 }}>
            Confidential Â· Restricted Access
          </p>
        </div>
      </aside>
    </>
  );
}
