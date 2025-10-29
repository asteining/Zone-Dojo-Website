export default function MerchPage() {
    return (
      <div className="mx-auto max-w-6xl px-4 py-16 text-white">
        {/* HEADER */}
        <section className="max-w-3xl">
          <h1 className="text-4xl font-extrabold tracking-tight text-white">
            <span className="text-red-500">ZoneDojo</span> Merch
          </h1>
          <p className="mt-4 text-lg text-zinc-300">
            Limited drops. Creator energy only. When it’s gone, it’s gone.
          </p>
          <p className="mt-2 text-sm text-zinc-500">
            We’re starting with tight runs so early supporters get stuff nobody
            else has. If you want something here, tap “I’m Interested” and DM us.
          </p>
        </section>
  
        {/* PRODUCT GRID */}
        <section className="mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {[
            {
              name: "ZoneDojo Hoodie V1",
              blurb: "Blackout heavyweight hoodie. Red detailing. Fight-night energy.",
              cta: "I'm Interested",
              imageAlt: "Black ZoneDojo hoodie mockup",
            },
            {
              name: "Limited Drop Tee",
              blurb: "20K Subscriber tee. This print never repeats.",
              cta: "I'm Interested",
              imageAlt: "Limited run tee mockup",
            },
            {
              name: "Creator Pack",
              blurb:
                "Hoodie + shoutout + early access to what we’re building next.",
              cta: "I'm Interested",
              imageAlt: "Creator pack bundle mockup",
            },
          ].map((item) => (
            <div
              key={item.name}
              className="rounded-xl border border-red-500/30 bg-zinc-900 p-6 shadow-xl flex flex-col"
            >
              {/* Image placeholder */}
              <div className="mb-4 h-48 w-full rounded-lg bg-zinc-800 border border-zinc-700 flex items-center justify-center text-zinc-600 text-xs">
                {item.imageAlt}
              </div>
  
              <div className="flex-1">
                <div className="text-white text-lg font-semibold">
                  {item.name}
                </div>
                <div className="mt-2 text-sm text-zinc-400 leading-relaxed">
                  {item.blurb}
                </div>
              </div>
  
              <a
                href="https://instagram.com/your-handle-here"
                target="_blank"
                rel="noopener noreferrer"
                className="mt-6 inline-block w-full rounded-lg border border-red-600 bg-red-600 px-4 py-2 text-center text-sm font-semibold text-white hover:bg-red-500 hover:border-red-500"
              >
                {item.cta}
              </a>
            </div>
          ))}
        </section>
  
        {/* DISCLAIMER / SCARCITY */}
        <section className="mt-16 max-w-2xl">
          <div className="rounded-xl border border-red-500/20 bg-zinc-900 p-6">
            <div className="text-sm text-zinc-300 font-medium">
              How ordering works:
            </div>
            <ul className="mt-3 space-y-2 text-sm text-zinc-400 leading-relaxed">
              <li>1. Tap “I’m Interested.”</li>
              <li>2. DM us what you want and your size.</li>
              <li>3. We confirm availability, price, and drop timing.</li>
            </ul>
            <div className="mt-4 text-xs text-zinc-500">
              We’re keeping the runs tight so only early supporters get first
              edition pieces. Full online checkout (Stripe / Shopify style) will
              drop after demand justifies it.
            </div>
          </div>
        </section>
      </div>
    );
  }
  