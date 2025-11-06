"use client";

import { useEffect, useMemo, useState } from "react";

// helpers
function normalize(str: string) {
  return (str || "").trim().toLowerCase();
}

function makeKey(email: string, handle: string) {
  const e = normalize(email);
  const h = normalize(handle);
  // store two keys to guard against editing one field
  return {
    emailKey: `zd:giveaway:email:${e}`,
    handleKey: `zd:giveaway:handle:${h}`,
    anyKey: `zd:giveaway:any:${e || h}`, // coarse lock
  };
}

export default function HomePage() {
  const [email, setEmail] = useState("");
  const [handle, setHandle] = useState("");
  const [status, setStatus] = useState<null | "ok" | "error" | "dup">(null);
  const [loading, setLoading] = useState(false);

  // honeypot anti-bot field (hidden from users)
  const [hp, setHp] = useState(""); // if filled, we ignore submission

  const alreadyEntered = useMemo(() => {
    if (typeof window === "undefined") return false;
    const { emailKey, handleKey } = makeKey(email, handle);
    return !!(localStorage.getItem(emailKey) || localStorage.getItem(handleKey));
  }, [email, handle]);

  useEffect(() => {
    // Also respect a coarse global lock so returning users see they're already in
    if (typeof window === "undefined") return;
    const coarse = localStorage.getItem("zd:giveaway:locked");
    if (coarse === "1") setStatus("dup");
  }, []);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();

    // basic front-end validation
    const validEmail = email && email.includes("@");
    const validHandle = handle && handle.trim().length >= 2; // adjust min length if needed
    if (!validEmail || !validHandle) {
      setStatus("error");
      return;
    }

    // bot guard: if honeypot filled, pretend success but do nothing
    if (hp) {
      setStatus("ok");
      setEmail("");
      setHandle("");
      return;
    }

    // duplicate guard (client-side)
    if (alreadyEntered) {
      setStatus("dup");
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

      // lock future attempts on this browser
      const { emailKey, handleKey } = makeKey(email, handle);
      localStorage.setItem(emailKey, "1");
      localStorage.setItem(handleKey, "1");
      localStorage.setItem("zd:giveaway:locked", "1");

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
      <section className="mx-auto max-w-7xl px-4 py-16">
        {/* Big T-shirt placeholder */}
        <div className="mb-10 w-full rounded-2xl border border-red-500/30 bg-zinc-900 p-4">
  <div className="flex items-center justify-center">
    <div className="aspect-[16/9] w-full max-w-2xl rounded-xl border border-zinc-800 bg-zinc-800/60 flex items-center justify-center text-center mx-auto">
      <div className="p-6 text-zinc-400">
        <div className="text-lg font-semibold">Custom T-Shirt Preview</div>
        <div className="mt-1 text-sm">Placeholder image (art coming soon)</div>
      </div>
    </div>
  </div>
</div>


        <div className="lg:flex lg:items-start lg:justify-between lg:gap-12">
          <div className="max-w-xl">
            <div className="inline-block rounded-full border border-red-500/40 bg-red-500/10 px-3 py-1 text-xs font-medium text-red-400">
              20K Subscriber Special
            </div>

            <h1 className="mt-4 text-4xl font-extrabold tracking-tight text-white sm:text-5xl leading-[1.1]">
             <span className="text-red-500">  ZoneDojo Giveaway</span> 🎉
            </h1>

            <p className="mt-4 text-lg text-zinc-300">
              We’re celebrating 20,000+ subscribers. Enter once for a chance to win
              our first limited-run ZoneDojo tee.
            </p>

           

            <p className="mt-6 text-xs text-zinc-500 max-w-sm">
              One entry per person. We’ll only use your info to contact winners and send
              ZoneDojo updates.
            </p>
          </div>

          {/* FORM CARD */}
          <div className="mt-10 w-full max-w-md rounded-xl border border-red-500/30 bg-zinc-900 p-6 shadow-xl lg:mt-0">
            <h2 className="text-xl font-semibold text-white">Enter the Giveaway</h2>
            <p className="mt-1 text-sm text-zinc-400">Must be subscribed on YouTube.</p>

            <form onSubmit={onSubmit} className="mt-6 space-y-4">
              {/* honeypot (hidden) */}
              <input
                type="text"
                value={hp}
                onChange={(e) => setHp(e.target.value)}
                className="hidden"
                aria-hidden="true"
                tabIndex={-1}
                autoComplete="off"
              />

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
                  YouTube handle (required)
                </label>
                <input
                  id="handle"
                  type="text"
                  required
                  className="w-full rounded-lg border border-zinc-700 bg-zinc-800 px-3 py-2 text-sm text-white outline-none ring-0 placeholder-zinc-500 focus:border-red-500 focus:ring-1 focus:ring-red-500"
                  placeholder="@yourchannel"
                  value={handle}
                  onChange={(e) => setHandle(e.target.value)}
                />
                <p className="mt-1 text-[11px] text-zinc-500">
                  Example: <span className="font-mono">@yourhandle</span>
                </p>
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
                  Check your email and handle, then try again.
                </p>
              )}
              {status === "dup" && (
                <p className="text-xs font-medium text-yellow-400">
                  Our records show you’ve already entered from this device/email/handle.
                </p>
              )}
            </form>
          </div>
        </div>
      </section>
    </div>
  );
}
