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
        <rect x="1" y="1" width="6" height="6" rx="0.5" stroke="currentColor" strokeWidth="1.2" />
        <rect x="9" y="1" width="6" height="6" rx="0.5" stroke="currentColor" strokeWidth="1.2" />
        <rect x="1" y="9" width="6" height="6" rx="0.5" stroke="currentColor" strokeWidth="1.2" />
        <rect x="9" y="9" width="6" height="6" rx="0.5" stroke="currentColor" strokeWidth="1.2" />
      </svg>
    ),
  },
  {
    href: "/persons",
    label: "Clients",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="5" r="2.5" stroke="currentColor" strokeWidth="1.2" />
        <path d="M2.5 13.5C2.5 11.015 5.015 9 8 9s5.5 2.015 5.5 4.5" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
      </svg>
    ),
  },
  {
    href: "/ledger",
    label: "Ledger",
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <rect x="2" y="1.5" width="12" height="13" rx="0.5" stroke="currentColor" strokeWidth="1.2" />
        <path d="M5 5.5h6M5 8h6M5 10.5h4" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
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
        className="lg:hidden fixed top-4 left-4 z-50 btn btn-ghost p-2"
        aria-label="Toggle menu"
      >
        {mobileOpen ? (
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 4l12 12M16 4L4 16" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
          </svg>
        ) : (
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M3 5h14M3 10h14M3 15h14" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
          </svg>
        )}
      </button>

      {/* Overlay */}
      {mobileOpen && (
        <div
          className="lg:hidden fixed inset-0 bg-black/60 z-40 backdrop-blur-sm"
          onClick={() => setMobileOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={cn(
          "fixed left-0 top-0 h-screen w-64 z-40 flex flex-col",
          "transition-transform duration-300 ease-in-out",
          "lg:translate-x-0",
          mobileOpen ? "translate-x-0" : "-translate-x-full"
        )}
        style={{
          background: "linear-gradient(180deg, #060C18 0%, #04080F 100%)",
          borderRight: "1px solid #152035",
        }}
      >
        {/* Header / Logo */}
        <div className="px-6 pt-8 pb-6" style={{ borderBottom: "1px solid #152035" }}>
          <div className="flex items-center gap-3">
            <div
              className="w-8 h-8 flex items-center justify-center"
              style={{
                background: "linear-gradient(135deg, #B87820 0%, #D4A848 100%)",
                clipPath: "polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%)",
              }}
            >
              <span className="text-[10px] font-bold" style={{ color: "#0A0E1A" }}>CM</span>
            </div>
            <div>
              <p
                className="text-xs font-semibold tracking-widest uppercase"
                style={{ color: "#C8963C" }}
              >
                Capital Mgmt
              </p>
              <p className="text-[10px] tracking-wider" style={{ color: "#3D5070" }}>
                PRIVATE FUND SYSTEM
              </p>
            </div>
          </div>
        </div>

        {/* Navigation */}
        <nav className="flex-1 px-3 py-6 space-y-1">
          <p
            className="px-3 mb-3 text-[10px] font-semibold tracking-widest uppercase"
            style={{ color: "#3D5070" }}
          >
            Navigation
          </p>
          {navItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              onClick={() => setMobileOpen(false)}
              className={cn(
                "flex items-center gap-3 px-3 py-2.5 rounded-[2px] text-sm transition-all duration-150",
                isActive(item.href)
                  ? "bg-[#0D1A2E] border border-[#1E3050]"
                  : "hover:bg-[#0A1524] border border-transparent"
              )}
              style={{
                color: isActive(item.href) ? "#C8963C" : "#6B83A8",
              }}
            >
              <span
                className={cn(
                  "transition-colors",
                  isActive(item.href) ? "text-[#C8963C]" : "text-[#3D5070]"
                )}
              >
                {item.icon}
              </span>
              <span className="font-medium tracking-wide">{item.label}</span>
              {isActive(item.href) && (
                <span
                  className="ml-auto w-1 h-4 rounded-full"
                  style={{ background: "#C8963C" }}
                />
              )}
            </Link>
          ))}
        </nav>

        {/* Footer */}
        <div className="px-6 py-4" style={{ borderTop: "1px solid #152035" }}>
          <p className="text-[10px] tracking-wider" style={{ color: "#3D5070" }}>
            CONFIDENTIAL &nbsp;·&nbsp; RESTRICTED ACCESS
          </p>
          <p className="text-[9px] mt-1" style={{ color: "#1E3050" }}>
            v1.0.0
          </p>
        </div>
      </aside>
    </>
  );
}
