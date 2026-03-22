/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        navy: {
          950: "#04080F",
          900: "#070D1A",
          800: "#0A1020",
          700: "#0D1528",
          600: "#111D35",
          500: "#162240",
          400: "#1E2D52",
          300: "#2A3D6B",
          200: "#3D5490",
        },
        gold: {
          950: "#1A1200",
          900: "#2D1F00",
          800: "#5C3D00",
          700: "#8A5A00",
          600: "#B87800",
          500: "#C8963C",
          400: "#D4A84E",
          300: "#E0BC6A",
          200: "#EDD08A",
          100: "#F5E4B2",
          50: "#FAF1D6",
        },
        slate: {
          950: "#08111F",
        },
      },
      fontFamily: {
        display: ["var(--font-cormorant)", "Georgia", "serif"],
        body: ["var(--font-dm-sans)", "system-ui", "sans-serif"],
        mono: ["var(--font-ibm-mono)", "Courier New", "monospace"],
      },
      backgroundImage: {
        "grid-pattern":
          "linear-gradient(rgba(200,150,60,0.03) 1px, transparent 1px), linear-gradient(90deg, rgba(200,150,60,0.03) 1px, transparent 1px)",
      },
      backgroundSize: {
        "grid-pattern": "40px 40px",
      },
      animation: {
        "fade-in": "fadeIn 0.4s ease-out",
        "slide-up": "slideUp 0.4s ease-out",
        "slide-in": "slideIn 0.3s ease-out",
        pulse: "pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite",
      },
      keyframes: {
        fadeIn: {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        slideUp: {
          "0%": { opacity: "0", transform: "translateY(12px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        slideIn: {
          "0%": { opacity: "0", transform: "translateX(-8px)" },
          "100%": { opacity: "1", transform: "translateX(0)" },
        },
      },
    },
  },
  plugins: [],
};
