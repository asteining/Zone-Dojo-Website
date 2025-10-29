import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ZoneDojoApp());
}

class ZoneDojoApp extends StatelessWidget {
  const ZoneDojoApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (BuildContext context, GoRouterState state) =>
            const AboutPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ZoneDojo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEA4335),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      routerConfig: _router,
    );
  }
}
