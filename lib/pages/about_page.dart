import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            _AboutHero(),
            _MissionSection(),
            _TeamGrid(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  const _AboutHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 96, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF111111),
            Color(0xFF1F1F1F),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'About ZoneDojo',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'We are a team of engineers, storytellers, and creators obsessed with building the next wave of tech talent. Through content, community, and curated giveaways, we help makers stay in the zone.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.8,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MissionSection extends StatelessWidget {
  const _MissionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Our Mission',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'ZoneDojo started as a passion project on YouTube—built to share honest breakdowns of the tools and workflows we use every day. As the channel grew, so did our community’s appetite for deeper knowledge and better equipment. Today, we channel our partnerships into giveaways that equip creators to tell bigger stories, faster.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.7,
                    ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF2F2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFEA4335).withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Core Pillars',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    _MissionBullet(
                      title: 'Level up creators',
                      description:
                          'We mentor upcoming voices in tech, design, and engineering to refine their craft and audience.',
                    ),
                    _MissionBullet(
                      title: 'Demystify the tools',
                      description:
                          'We break down complex workflows and gear setups so creators can stay focused on their storytelling.',
                    ),
                    _MissionBullet(
                      title: 'Reward community loyalty',
                      description:
                          'We reinvest sponsorships into giveaways that directly benefit our most dedicated supporters.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MissionBullet extends StatelessWidget {
  const _MissionBullet({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.check_circle, color: Color(0xFFEA4335)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black87,
                        height: 1.6,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamGrid extends StatelessWidget {
  const _TeamGrid();

  @override
  Widget build(BuildContext context) {
    final List<_TeamMember> members = <_TeamMember>[
      const _TeamMember(
        name: 'Lena Sparks',
        role: 'Host & Engineer',
        bio:
            'Lena architects our tech experiments and delivers the deep dives the community loves.',
      ),
      const _TeamMember(
        name: 'Jordan Flux',
        role: 'Producer',
        bio: 'Jordan keeps the dojo running tight with cinematic storytelling and crisp edits.',
      ),
      const _TeamMember(
        name: 'Amara Pulse',
        role: 'Community Lead',
        bio:
            'Amara champions the creators that power ZoneDojo, orchestrating giveaways and live activations.',
      ),
    ];

    return Container(
      color: const Color(0xFFF6F6F6),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Meet the Team',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final bool isCompact = constraints.maxWidth < 900;
                  final double cardWidth = isCompact
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 3;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: members
                        .map(
                          (_TeamMember member) => SizedBox(
                            width: cardWidth,
                            child: _TeamMemberCard(member: member),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  const _TeamMemberCard({required this.member});

  final _TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 18,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFFEA4335),
                  Color(0xFF111111),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  member.name.split(' ').first,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            member.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            member.role,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: const Color(0xFFEA4335), fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            member.bio,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

class _TeamMember {
  const _TeamMember({required this.name, required this.role, required this.bio});

  final String name;
  final String role;
  final String bio;
}
