"use client";

import { cn } from "@/lib/utils";
import { ReactNode, ButtonHTMLAttributes, InputHTMLAttributes, TextareaHTMLAttributes, SelectHTMLAttributes } from "react";

// ─── PageHeader ──────────────────────────────────────────────────────────────

export function PageHeader({
  title,
  subtitle,
  action,
}: {
  title: string;
  subtitle?: string;
  action?: ReactNode;
}) {
  return (
    <div className="flex items-start justify-between gap-4 mb-8">
      <div>
        <h1
          className="font-display text-3xl font-light tracking-wide"
          style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}
        >
          {title}
        </h1>
        {subtitle && (
          <p className="mt-1 text-sm" style={{ color: "#6B83A8" }}>
            {subtitle}
          </p>
        )}
      </div>
      {action && <div className="flex-shrink-0">{action}</div>}
    </div>
  );
}

// ─── StatCard ────────────────────────────────────────────────────────────────

export function StatCard({
  label,
  value,
  sub,
  accent = "default",
  icon,
}: {
  label: string;
  value: string;
  sub?: string;
  accent?: "default" | "credit" | "debit" | "gold";
  icon?: ReactNode;
}) {
  const accentMap = {
    default: { color: "#6B83A8", glow: "none", border: "#152035" },
    credit: { color: "#2ECC8E", glow: "0 0 40px rgba(46,204,142,0.05)", border: "rgba(46,204,142,0.15)" },
    debit: { color: "#E05555", glow: "0 0 40px rgba(224,85,85,0.05)", border: "rgba(224,85,85,0.15)" },
    gold: { color: "#C8963C", glow: "0 0 40px rgba(200,150,60,0.08)", border: "rgba(200,150,60,0.2)" },
  };

  const { color, glow, border } = accentMap[accent];

  return (
    <div
      className="card p-5 relative overflow-hidden"
      style={{ boxShadow: glow, borderColor: border }}
    >
      <div
        className="absolute top-0 left-0 right-0 h-px"
        style={{
          background: `linear-gradient(90deg, transparent, ${color}40, transparent)`,
        }}
      />
      <div className="flex items-start justify-between gap-3">
        <div>
          <p
            className="text-[10px] font-semibold tracking-widest uppercase mb-2"
            style={{ color: "#3D5070" }}
          >
            {label}
          </p>
          <p
            className="font-mono text-xl font-medium"
            style={{ color: accent === "default" ? "#E8EDF8" : color }}
          >
            {value}
          </p>
          {sub && (
            <p className="text-xs mt-1" style={{ color: "#3D5070" }}>
              {sub}
            </p>
          )}
        </div>
        {icon && (
          <div
            className="mt-0.5 opacity-40"
            style={{ color }}
          >
            {icon}
          </div>
        )}
      </div>
    </div>
  );
}

// ─── Button ──────────────────────────────────────────────────────────────────

type ButtonVariant = "gold" | "outline" | "ghost" | "danger" | "credit" | "debit";

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant;
  size?: "sm" | "md" | "lg";
  loading?: boolean;
  children: ReactNode;
}

export function Button({
  variant = "outline",
  size = "md",
  loading,
  children,
  className,
  disabled,
  ...props
}: ButtonProps) {
  const sizeClass = {
    sm: "px-3 py-1.5 text-xs",
    md: "px-4 py-2.5 text-[0.8125rem]",
    lg: "px-6 py-3 text-sm",
  }[size];

  return (
    <button
      className={cn(`btn btn-${variant}`, sizeClass, className)}
      disabled={disabled || loading}
      {...props}
    >
      {loading && (
        <svg
          className="animate-spin"
          width="14"
          height="14"
          viewBox="0 0 14 14"
          fill="none"
        >
          <circle
            cx="7"
            cy="7"
            r="5"
            stroke="currentColor"
            strokeWidth="1.5"
            strokeDasharray="20 10"
          />
        </svg>
      )}
      {children}
    </button>
  );
}

// ─── Input ───────────────────────────────────────────────────────────────────

interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
  hint?: string;
}

export function Input({ label, error, hint, className, id, ...props }: InputProps) {
  const inputId = id || label?.toLowerCase().replace(/\s+/g, "-");

  return (
    <div className="space-y-1.5">
      {label && (
        <label
          htmlFor={inputId}
          className="block text-[11px] font-semibold tracking-widest uppercase"
          style={{ color: "#3D5070" }}
        >
          {label}
        </label>
      )}
      <input
        id={inputId}
        className={cn("input", error && "border-[#E05555]", className)}
        {...props}
      />
      {error && (
        <p className="text-xs" style={{ color: "#E05555" }}>
          {error}
        </p>
      )}
      {hint && !error && (
        <p className="text-xs" style={{ color: "#3D5070" }}>
          {hint}
        </p>
      )}
    </div>
  );
}

// ─── Textarea ────────────────────────────────────────────────────────────────

interface TextareaProps extends TextareaHTMLAttributes<HTMLTextAreaElement> {
  label?: string;
  error?: string;
}

export function Textarea({ label, error, className, id, ...props }: TextareaProps) {
  const inputId = id || label?.toLowerCase().replace(/\s+/g, "-");

  return (
    <div className="space-y-1.5">
      {label && (
        <label
          htmlFor={inputId}
          className="block text-[11px] font-semibold tracking-widest uppercase"
          style={{ color: "#3D5070" }}
        >
          {label}
        </label>
      )}
      <textarea
        id={inputId}
        className={cn("input resize-none", error && "border-[#E05555]", className)}
        {...props}
      />
      {error && (
        <p className="text-xs" style={{ color: "#E05555" }}>
          {error}
        </p>
      )}
    </div>
  );
}

// ─── Select ──────────────────────────────────────────────────────────────────

interface SelectProps extends SelectHTMLAttributes<HTMLSelectElement> {
  label?: string;
  error?: string;
  children: ReactNode;
}

export function Select({ label, error, children, className, id, ...props }: SelectProps) {
  const inputId = id || label?.toLowerCase().replace(/\s+/g, "-");

  return (
    <div className="space-y-1.5">
      {label && (
        <label
          htmlFor={inputId}
          className="block text-[11px] font-semibold tracking-widest uppercase"
          style={{ color: "#3D5070" }}
        >
          {label}
        </label>
      )}
      <select
        id={inputId}
        className={cn("input", error && "border-[#E05555]", className)}
        style={{
          background: "#07101C",
          color: "#E8EDF8",
          appearance: "none",
          backgroundImage: `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M2 4l4 4 4-4' stroke='%236B83A8' strokeWidth='1.2' fill='none' strokeLinecap='square'/%3E%3C/svg%3E")`,
          backgroundRepeat: "no-repeat",
          backgroundPosition: "right 12px center",
          paddingRight: "36px",
        }}
        {...props}
      >
        {children}
      </select>
      {error && (
        <p className="text-xs" style={{ color: "#E05555" }}>
          {error}
        </p>
      )}
    </div>
  );
}

// ─── EmptyState ──────────────────────────────────────────────────────────────

export function EmptyState({
  icon,
  title,
  description,
  action,
}: {
  icon?: ReactNode;
  title: string;
  description?: string;
  action?: ReactNode;
}) {
  return (
    <div className="flex flex-col items-center justify-center py-16 px-4 text-center">
      {icon && (
        <div className="mb-4 opacity-20" style={{ color: "#6B83A8" }}>
          {icon}
        </div>
      )}
      <h3
        className="font-display text-xl font-light"
        style={{ color: "#6B83A8" }}
      >
        {title}
      </h3>
      {description && (
        <p className="text-xs mt-2 max-w-xs" style={{ color: "#3D5070" }}>
          {description}
        </p>
      )}
      {action && <div className="mt-6">{action}</div>}
    </div>
  );
}

// ─── Divider ─────────────────────────────────────────────────────────────────

export function Divider({ label }: { label?: string }) {
  if (label) {
    return <div className="divider-label my-6">{label}</div>;
  }
  return <div className="gold-rule my-6" />;
}

// ─── Badge ───────────────────────────────────────────────────────────────────

export function Badge({
  children,
  variant = "gold",
}: {
  children: ReactNode;
  variant?: "credit" | "debit" | "success" | "gold";
}) {
  return <span className={`badge badge-${variant}`}>{children}</span>;
}

// ─── Section ─────────────────────────────────────────────────────────────────

export function Section({
  title,
  children,
  action,
}: {
  title?: string;
  children: ReactNode;
  action?: ReactNode;
}) {
  return (
    <section className="mb-8">
      {title && (
        <div className="flex items-center justify-between mb-4">
          <h2
            className="text-[11px] font-semibold tracking-widest uppercase"
            style={{ color: "#3D5070" }}
          >
            {title}
          </h2>
          {action}
        </div>
      )}
      {children}
    </section>
  );
}

// ─── LoadingSpinner ───────────────────────────────────────────────────────────

export function LoadingSpinner() {
  return (
    <div className="flex items-center justify-center py-16">
      <div className="relative">
        <div
          className="w-10 h-10 rounded-full border-2"
          style={{ borderColor: "#152035" }}
        />
        <div
          className="absolute inset-0 w-10 h-10 rounded-full border-2 border-transparent animate-spin"
          style={{ borderTopColor: "#C8963C" }}
        />
      </div>
    </div>
  );
}
