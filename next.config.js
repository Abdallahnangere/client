/** @type {import('next').NextConfig} */
const nextConfig = {
  // Moved out of experimental in Next.js 14.1+
  serverExternalPackages: ["@neondatabase/serverless"],
};

module.exports = nextConfig;
