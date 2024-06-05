import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/presentation/screens/login/login_screen.dart';
import 'package:frontend/presentation/screens/home/playlist_screen.dart';
import 'package:frontend/presentation/widgets/song_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
      const HomeScreen(),
    ),
    GoRoute(
      path: '/song',
      name: SongScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
      const SongScreen(),
    ),
  ],
);
