"use client";

import { useState } from "react";

export default function ServicesPage() {
  const [name, setName] = useState("");
  const [contact, setContact] = useState("");
  const [channel, setChannel] = useState("");
  const [needs, setNeeds] = useState("");
  const [sent, setSent] = useState<null | "ok" | "error">(null);
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!name || !contact || !needs) {
      setSent("error");
      return;
    }

    try {
      setLoading(true);
      setSent(null);

      const FORMSPREE_URL = "https://formspree.io/f/myzbjpgz";

      const res = await fetch(FORMSPREE_URL, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          form_name: "ZoneDojo Service Request",
          name,
          contact,
          channel,
          needs,
        }),
      });

      if (!res.ok) {
        throw new Error("Submit failed");
      }

      setSent("ok");
      setName("");
      setContact("");
      setChannel("");
      setNeeds("");
    } catch (err) {
      console.error(err);
      setSent("error");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="mx-auto max-w-6xl px-4 py-16 text-white">
      {/* HERO */}
      <section className="max-w-3xl">
        <h1 className="text-4xl font-extrabold tracking-tight text-red-500">
          You shoot. <span className="text-red-500">We edit.</span>
        </h1>
       
      </section>

      {/* SERVICES GRID */}
      <section className="mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {[
          {
            title: "Short-Form Editing",
            desc: "TikTok / Reels / Shorts",
          },
          {
            title: "YouTube Long-Form",
            desc: "Full video structure, pacing, and storytelling",
          },
          {
            title: "Brand & Thumbnails",
            desc: "Titles, thumbnails, and on-screen text identity",
          },
        ].map((card) => (
          <div
            key={card.title}
            className="rounded-xl border border-red-500/30 bg-zinc-900 p-6 shadow-xl"
          >
            <div className="text-lg font-semibold text-white">
              {card.title}
            </div>
            <div className="mt-2 text-sm text-zinc-400 leading-relaxed">
              {card.desc}
            </div>
          </div>
        ))}
      </section>

      {/* QUOTE FORM */}
      <section className="mt-16 max-w-lg rounded-xl border border-red-500/30 bg-zinc-900 p-6 shadow-xl">
        <h2 className="text-xl font-semibold text-white">
          Request a Quote
        </h2>
        <p className="mt-1 text-sm text-zinc-400">
          Tell us what you’re trying to build. We’ll get back fast.
        </p>

        <form onSubmit={handleSubmit} className="mt-6 space-y-4">
          <div>
            <label className="mb-1 block text-xs font-medium text-zinc-300">
              Your full name (required)
            </label>
            <input
              className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
              placeholder="John Smith / Adam Murphy / etc."
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </div>

          <div>
            <label className="mb-1 block text-xs font-medium text-zinc-300">
              Contact (email or Instagram) (required)
            </label>
            <input
              className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
              placeholder="you@example.com or @yourhandle"
              value={contact}
              onChange={(e) => setContact(e.target.value)}
            />
          </div>

          <div>
            <label className="mb-1 block text-xs font-medium text-zinc-300">
              Channel / Social link (optional)
            </label>
            <input
              className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
              placeholder="youtube.com/@you or tiktok.com/@you"
              value={channel}
              onChange={(e) => setChannel(e.target.value)}
            />
          </div>

          <div>
            <label className="mb-1 block text-xs font-medium text-zinc-300">
              What do you need? (required)
            </label>
            <textarea
              className="min-h-[100px] w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
              placeholder="Example: I need 8 Shorts/week from raw iPhone footage + 1 YouTube video every Sunday."
              value={needs}
              onChange={(e) => setNeeds(e.target.value)}
            />
          </div>

          <button
            className="w-full rounded-lg border border-red-600 bg-red-600 px-4 py-2 text-center text-sm font-semibold text-white hover:bg-red-500 hover:border-red-500 disabled:opacity-50 disabled:cursor-not-allowed"
            disabled={loading}
          >
            {loading ? "Sending..." : "Get My Quote"}
          </button>

          {sent === "ok" && (
            <p className="text-xs font-medium text-green-400">
              Got it. We’ll reach out.
            </p>
          )}
          {sent === "error" && (
            <p className="text-xs font-medium text-red-400">
              Need your name, contact, and what you’re asking for.
            </p>
          )}
        </form>
      </section>
    </div>
  );
}
