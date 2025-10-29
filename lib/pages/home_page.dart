import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const _HeroSection(),
            const _FeatureHighlights(),
            const _TestimonialStrip(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isVertical = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isVertical ? 24 : 72,
            vertical: isVertical ? 56 : 96,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFFAFAFA),
                Color(0xFFFFEAEA),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Flex(
            direction: isVertical ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: isVertical
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: isVertical ? 0 : 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEA4335).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.local_fire_department,
                              color: Color(0xFFEA4335)),
                          SizedBox(width: 8),
                          Text(
                            'Exclusive Creator Tech Giveaway',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Level Up Your Zone',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Join the ZoneDojo giveaway for a chance to win creator-grade gear, mentorship sessions, and behind-the-scenes access to our tech dojo.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.black87,
                            height: 1.6,
                          ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: <Widget>[
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 18,
                            ),
                            backgroundColor: const Color(0xFFEA4335),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Enter Giveaway',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 18,
                            ),
                            side: const BorderSide(color: Colors.black87, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Watch the Trailer',
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const <Widget>[
                        _StatPill(number: '250K+', label: 'YouTube Subscribers'),
                        _StatPill(number: '50+', label: 'Giveaway Winners'),
                        _StatPill(number: '24/7', label: 'Creator Support'),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isVertical) const SizedBox(width: 64) else const SizedBox(height: 48),
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xFF111111),
                          Color(0xFFEA4335),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 24,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Grand Prize Bundle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            '• Custom-built editing rig\n• Studio lighting kit\n• Collaboration session with Team ZoneDojo',
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FeatureHighlights extends StatelessWidget {
  const _FeatureHighlights();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isCompact = constraints.maxWidth < 960;
          final List<_FeatureData> features = <_FeatureData>[
            _FeatureData(
              title: 'Creator-grade Gear',
              description:
                  'Curated hardware and software that we trust for building viral tech content.',
              icon: Icons.videocam,
            ),
            _FeatureData(
              title: 'Mentor Access',
              description:
                  'Live coaching sessions with the ZoneDojo crew to sharpen your craft.',
              icon: Icons.groups,
            ),
            _FeatureData(
              title: 'Community Boost',
              description:
                  'Get featured across our platforms and grow alongside the dojo.',
              icon: Icons.rocket_launch,
            ),
          ];

          return Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment:
                isCompact ? WrapAlignment.center : WrapAlignment.spaceBetween,
            children: features
                .map(
                  (_FeatureData feature) => SizedBox(
                    width: isCompact
                        ? constraints.maxWidth
                        : (constraints.maxWidth - 48) / 3,
                    child: _FeatureCard(feature: feature),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.feature});

  final _FeatureData feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFFEA4335),
              shape: BoxShape.circle,
            ),
            child: Icon(feature.icon, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            feature.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            feature.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

class _FeatureData {
  const _FeatureData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class _TestimonialStrip extends StatelessWidget {
  const _TestimonialStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'What creators are saying',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: const <Widget>[
                  _TestimonialCard(
                    quote:
                        '“ZoneDojo helped me rebuild my studio from the ground up. The mentorship unlocked my channel’s next tier.”',
                    author: 'Kai, Tech Creator',
                  ),
                  _TestimonialCard(
                    quote:
                        '“The giveaway delivered serious gear, but the community is what keeps me leveling up.”',
                    author: 'Mila, Dev Streamer',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.quote, required this.author});

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              quote,
              style: const TextStyle(
                color: Colors.white,
                height: 1.6,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              author,
              style: const TextStyle(
                color: Color(0xFFFF6F61),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.number, required this.label});

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            number,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
