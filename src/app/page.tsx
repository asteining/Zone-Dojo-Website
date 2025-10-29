"use client";

import { useState } from "react";

export default function HomePage() {
  const [email, setEmail] = useState("");
  const [handle, setHandle] = useState("");
  const [status, setStatus] = useState<null | "ok" | "error">(null);
  const [loading, setLoading] = useState(false);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!email || !email.includes("@")) {
      setStatus("error");
      return;
    }

    try {
      setLoading(true);
      setStatus(null);

      const FORMSPREE_URL = "https://formspree.io/f/myzbjpgz";

      const res = await fetch(FORMSPREE_URL, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          form_name: "ZoneDojo Giveaway Entry",
          email,
          youtubeHandle: handle,
        }),
      });

      if (!res.ok) {
        throw new Error("Form submit failed");
      }

      setStatus("ok");
      setEmail("");
      setHandle("");
    } catch (err) {
      console.error(err);
      setStatus("error");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="text-white">
      {/* HERO SECTION */}
      <section className="mx-auto max-w-7xl px-4 py-16 lg:flex lg:items-start lg:justify-between lg:gap-12">
        <div className="max-w-xl">
          <div className="inline-block rounded-full border border-red-500/40 bg-red-500/10 px-3 py-1 text-xs font-medium text-red-400">
            20K Subscriber Special
          </div>

          <h1 className="mt-4 text-4xl font-extrabold tracking-tight text-white sm:text-5xl leading-[1.1]">
            ZoneDojo <span className="text-red-500">Giveaway</span> 🎉
          </h1>

          <p className="mt-4 text-lg text-zinc-300">
            We’re celebrating 20,000+ subscribers. Drop your email for a
            chance to win exclusive ZoneDojo merch. It takes 10 seconds and
            yes, it’s actually free.
          </p>

          <ul className="mt-6 space-y-2 text-sm text-zinc-400">
            <li>• Custom hoodie / tee drops</li>
            <li>• Shoutouts on the channel</li>
            <li>• Early access to new stuff we’re building</li>
          </ul>

          <p className="mt-6 text-xs text-zinc-500 max-w-sm">
            We’ll only use your email to contact winners and send ZoneDojo
            updates. No spam, no selling your info.
          </p>
        </div>

        {/* FORM CARD */}
        <div className="mt-10 w-full max-w-md rounded-xl border border-red-500/30 bg-zinc-900 p-6 shadow-xl lg:mt-0">
          <h2 className="text-xl font-semibold text-white">
            Enter the Giveaway
          </h2>
          <p className="mt-1 text-sm text-zinc-400">
            Winners will be contacted directly by email.
          </p>

          <form onSubmit={onSubmit} className="mt-6 space-y-4">
            <div>
              <label
                htmlFor="email"
                className="mb-1 block text-xs font-medium text-zinc-300"
              >
                Email (required)
              </label>
              <input
                id="email"
                type="email"
                required
                className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none ring-0 placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
                placeholder="you@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>

            <div>
              <label
                htmlFor="handle"
                className="mb-1 block text-xs font-medium text-zinc-300"
              >
                YouTube handle (optional)
              </label>
              <input
                id="handle"
                type="text"
                className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none ring-0 placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
                placeholder="@ZoneDojoFan17"
                value={handle}
                onChange={(e) => setHandle(e.target.value)}
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full rounded-lg border border-red-600 bg-red-600 px-4 py-2 text-center text-sm font-semibold text-white hover:bg-red-500 hover:border-red-500 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {loading ? "Submitting..." : "Enter Giveaway"}
            </button>

            {status === "ok" && (
              <p className="text-xs font-medium text-green-400">
                You’re in 🎯 Good luck.
              </p>
            )}
            {status === "error" && (
              <p className="text-xs font-medium text-red-400">
                Something went wrong. Check your email and try again.
              </p>
            )}
          </form>
        </div>
      </section>

      {/* MERCH PREVIEW SECTION */}
      <section className="mx-auto max-w-7xl px-4 pb-24">
        <h2 className="text-2xl font-bold text-white">What You Can Win 🥷</h2>
        <p className="mt-2 text-sm text-zinc-400 max-w-lg">
          Real merch. Real people wearing it. Not AI mockups.
        </p>

        <div className="mt-8 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {[
            {
              name: "ZoneDojo Hoodie V1",
              desc: "Blackout heavyweight hoodie. Fight-night energy.",
            },
            {
              name: "Limited Drop Tee",
              desc: "Only printed for 20K subs. Never again.",
            },
            {
              name: "Creator Pack",
              desc: "Shoutout + early access to new tools we’re building.",
            },
          ].map((item) => (
            <div
              key={item.name}
              className="rounded-xl border border-red-500/20 bg-zinc-900 p-5"
            >
              <div className="mb-4 h-40 w-full rounded-lg bg-zinc-800" />
              <div className="text-white font-semibold">{item.name}</div>
              <div className="text-sm text-zinc-400">{item.desc}</div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
