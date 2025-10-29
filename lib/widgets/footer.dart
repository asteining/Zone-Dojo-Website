import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isVertical = constraints.maxWidth < 640;
          final TextStyle mutedStyle = Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white70);

          return Flex(
            direction: isVertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: isVertical
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                isVertical ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'ZoneDojo',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
              ),
              const SizedBox(height: 16, width: 16),
              Expanded(
                child: Wrap(
                  alignment: isVertical ? WrapAlignment.start : WrapAlignment.end,
                  spacing: 16,
                  runSpacing: 8,
                  children: <Widget>[
                    Text('© ${DateTime.now().year} ZoneDojo. All rights reserved.',
                        style: mutedStyle),
                    Text('Privacy', style: mutedStyle),
                    Text('Terms', style: mutedStyle),
                    Text('Contact', style: mutedStyle),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
