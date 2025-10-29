"use client";

import { useState } from "react";
import Link from "next/link";

export default function NavBar() {
  const [open, setOpen] = useState(false);

  const navLinks = [
    { label: "Giveaway", href: "/" },
    { label: "About", href: "/about" },
    { label: "Services", href: "/services" },
    { label: "Merch", href: "/merch" },
  ];

  return (
    <header className="sticky top-0 z-50 w-full border-b border-red-500/30 bg-black/80 backdrop-blur-md">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3 text-white">
        {/* Logo / Brand */}
        <Link
          href="/"
          className="text-lg font-bold tracking-tight text-white hover:text-red-500"
        >
          ZoneDojo
        </Link>

        {/* Desktop nav */}
        <nav className="hidden gap-6 text-sm font-medium sm:flex">
          {navLinks.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="text-zinc-300 hover:text-red-500 transition-colors"
            >
              {item.label}
            </Link>
          ))}
        </nav>

        {/* Mobile menu button */}
        <button
          className="sm:hidden rounded-md border border-red-500/40 px-3 py-2 text-sm text-white hover:bg-red-600 hover:border-red-600"
          onClick={() => setOpen((o) => !o)}
        >
          {open ? "CLOSE" : "MENU"}
        </button>
      </div>

      {/* Mobile dropdown */}
      {open && (
        <div className="sm:hidden border-t border-red-500/30 bg-black px-4 py-3 text-white">
          <nav className="flex flex-col gap-3 text-base">
            {navLinks.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => setOpen(false)}
                className="text-zinc-200 hover:text-red-500 transition-colors"
              >
                {item.label}
              </Link>
            ))}
          </nav>
        </div>
      )}
    </header>
  );
}
