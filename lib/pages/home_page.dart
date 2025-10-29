import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _submitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isMobile = constraints.maxWidth < 700;
          final bool isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1100;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 40,
                    vertical: isMobile ? 32 : 48,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildHeroSection(context, isMobile),
                      const SizedBox(height: 40),
                      _buildImageGrid(isMobile: isMobile, isTablet: isTablet),
                      const SizedBox(height: 48),
                      _buildSignupForm(isMobile),
                      const SizedBox(height: 64),
                      const Footer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    final double headlineSize = isMobile ? 38 : 56;
    final double subtitleSize = isMobile ? 18 : 20;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 32 : 48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: <Color>[
            Color(0xFFFFF4E6),
            Color(0xFFFFE0E6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '20K Subscriber Giveaway 🎉',
            textAlign: isMobile ? TextAlign.left : TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Enter below to win exclusive ZoneDojo merch!',
            textAlign: isMobile ? TextAlign.left : TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: subtitleSize,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid({required bool isMobile, required bool isTablet}) {
    final List<String> merchNames = <String>[
      'Holographic Stickers',
      'Custom Hoodie',
      'Collector Mug',
      'Embroidered Cap',
      'Desk Mat',
      'Signed Poster',
    ];

    final int crossAxisCount = isMobile
        ? 2
        : isTablet
            ? 3
            : 4;
    final double spacing = 16;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double totalSpacing = spacing * (crossAxisCount - 1);
        final double itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: merchNames
              .map(
                (String name) => SizedBox(
                  width: itemWidth,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color(0xFFE5E7EB),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      const Color(0xFF111827).withOpacity(0.05),
                                      const Color(0xFFEA4335).withOpacity(0.1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildSignupForm(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign up for the giveaway',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email.';
                    }
                    final bool isValidEmail = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(value.trim());
                    if (!isValidEmail) {
                      return 'Enter a valid email address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'YouTube username (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: const Color(0xFFEA4335),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: _submit,
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _submitted
                      ? Container(
                          key: const ValueKey<String>('success'),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6FFFA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF2DD4BF)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Icon(Icons.check_circle, color: Color(0xFF0F766E)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  "You're in! Check your inbox for giveaway updates.",
                                  style: const TextStyle(
                                    color: Color(0xFF0F766E),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
