export default function AboutPage() {
    return (
      <div className="mx-auto max-w-4xl px-4 py-16 text-white">
        <div className="mb-10">
          <h1 className="text-4xl font-extrabold tracking-tight text-white">
            What is <span className="text-red-500">ZoneDojo</span>?
          </h1>
          <p className="mt-4 text-zinc-300 text-lg">
            ZoneDojo is a creator dojo. We take raw energy, rough clips,
            half-finished ideas — and turn them into something dangerous.
            We are celebrating 20,000+ subscribers and we’re only getting louder.
          </p>
        </div>
  
        <div className="mb-10">
          <h2 className="text-2xl font-bold text-white">Our Mission</h2>
          <p className="mt-3 text-zinc-400 text-sm leading-relaxed">
            Most creators are one good edit away from breaking through.
            We exist to make that edit happen. Whether it’s pacing,
            captions, hooks, thumbnails, or full channel identity —
            we help you look like you already made it.
          </p>
        </div>
  
        <div className="mb-10">
          <h2 className="text-2xl font-bold text-white">Who’s Behind This</h2>
  
          <div className="mt-6 space-y-6">
            <div className="flex items-start gap-4">
              <div className="h-16 w-16 flex-shrink-0 rounded-full bg-zinc-800 border border-red-500/30" />
              <div>
                <div className="font-semibold text-white">Creator / Lead Editor</div>
                <div className="text-sm text-zinc-400">
                  Cuts clips, builds storylines, fixes pacing, adds impact text,
                  makes you scroll-stopping in 1.5 seconds.
                </div>
              </div>
            </div>
  
            <div className="flex items-start gap-4">
              <div className="h-16 w-16 flex-shrink-0 rounded-full bg-zinc-800 border border-red-500/30" />
              <div>
                <div className="font-semibold text-white">Brand / Direction</div>
                <div className="text-sm text-zinc-400">
                  Makes sure everything — thumbnails, hooks, captions — feels
                  like you, not a template. We’re not corporate. We’re not beige.
                </div>
              </div>
            </div>
          </div>
        </div>
  
        <div>
          <h2 className="text-2xl font-bold text-white">What We Do</h2>
          <div className="mt-4 flex flex-wrap gap-2">
            {[
              "Short-form Editing",
              "YouTube Long-form",
              "Thumbnails & Titles",
              "Channel Identity",
              "Growth Strategy",
            ].map((tag) => (
              <span
                key={tag}
                className="rounded-full border border-red-500/40 bg-red-500/10 px-3 py-1 text-xs font-medium text-red-400"
              >
                {tag}
              </span>
            ))}
          </div>
        </div>
      </div>
    );
  }
  