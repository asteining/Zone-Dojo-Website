import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isCompact = constraints.maxWidth < 720;
        final TextStyle linkStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            );

        return AppBar(
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black12,
          centerTitle: false,
          titleSpacing: 24,
          title: Text(
            'ZoneDojo',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
          ),
          actions: <Widget>[
            if (!isCompact)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    onPressed: () => context.go('/'),
                    child: Text('Home', style: linkStyle),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => context.go('/about'),
                    child: Text('About', style: linkStyle),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFEA4335),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Enter Giveaway'),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            if (isCompact)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _NavBarMenu(
                  linkStyle: linkStyle,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _NavBarMenu extends StatefulWidget {
  const _NavBarMenu({required this.linkStyle});

  final TextStyle linkStyle;

  @override
  State<_NavBarMenu> createState() => _NavBarMenuState();
}

class _NavBarMenuState extends State<_NavBarMenu> {
  bool isOpen = false;

  void _toggle() {
    setState(() => isOpen = !isOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: _toggle,
        ),
        if (isOpen)
          Container(
            width: 180,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    context.go('/');
                    _toggle();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Home', style: widget.linkStyle),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/about');
                    _toggle();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('About', style: widget.linkStyle),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFEA4335),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Enter Giveaway'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
