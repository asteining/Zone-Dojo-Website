import Link from "next/link";

export default function Footer() {
  return (
    <footer className="mt-16 border-t border-red-500/30 bg-black px-4 py-10 text-white">
      <div className="mx-auto flex max-w-7xl flex-col items-center justify-between gap-6 text-center sm:flex-row sm:text-left">
        <div className="text-zinc-400 text-sm">
          © 2025 ZoneDojo · All rights reserved
        </div>

        <div className="flex items-center gap-6 text-sm">
          <Link
            href="https://youtube.com"
            className="text-zinc-300 hover:text-red-500 transition-colors"
          >
            YouTube
          </Link>
          <Link
            href="https://instagram.com"
            className="text-zinc-300 hover:text-red-500 transition-colors"
          >
            Instagram
          </Link>
          <Link
            href="https://twitter.com"
            className="text-zinc-300 hover:text-red-500 transition-colors"
          >
            X / Twitter
          </Link>
        </div>
      </div>
    </footer>
  );
}
