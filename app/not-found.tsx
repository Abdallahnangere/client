import Link from "next/link";

export default function NotFound() {
  return (
    <div className="min-h-screen flex items-center justify-center p-6">
      <div className="text-center">
        <p
          className="font-mono text-6xl font-light mb-4"
          style={{ color: "#1E3050" }}
        >
          404
        </p>
        <h1
          className="font-display text-3xl font-light mb-2"
          style={{ color: "#6B83A8" }}
        >
          Page Not Found
        </h1>
        <p className="text-sm mb-8" style={{ color: "#3D5070" }}>
          The resource you requested does not exist.
        </p>
        <Link href="/" className="btn btn-gold">
          Return to Overview
        </Link>
      </div>
    </div>
  );
}
