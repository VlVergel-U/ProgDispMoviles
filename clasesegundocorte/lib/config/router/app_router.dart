import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/button/buttons_screen.dart';
import '../../presentation/screens/card/card_screen.dart';
import '../../presentation/screens/change_theme/change_theme.dart';
import '../../presentation/screens/controls/control_screen.dart';
import '../../presentation/screens/counter_screen/counter_screen.dart';
import '../../presentation/screens/form/form_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/infinity/infinity_screen.dart';
import '../../presentation/screens/progress/progress_screen.dart';
import '../../presentation/screens/snack/snack_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: 'buttons',
      builder: (BuildContext context, GoRouterState state) =>
          const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: 'card',
      builder: (BuildContext context, GoRouterState state) =>
          const CardScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: 'progress',
      builder: (BuildContext context, GoRouterState state) =>
          const ProgressScreen(),
    ),
    GoRoute(
      path: '/snack',
      name: 'snack',
      builder: (BuildContext context, GoRouterState state) =>
          const SnackScreen(),
    ),
    GoRoute(
      path: '/control',
      name: 'control',
      builder: (BuildContext context, GoRouterState state) =>
          const ControlScreen(),
    ),
    GoRoute(
      path: '/infinity',
      name: 'infinity',
      builder: (BuildContext context, GoRouterState state) =>
          const InifinityScreen(),
    ),
    GoRoute(
      path: '/counter-screen',
      name: CounterScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const CounterScreen(),
    ),
    GoRoute(
      path: '/change-theme',
      name: ChangeTheme.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ChangeTheme(),
    ),
    GoRoute(
      path: '/formulario',
      name: FormScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const FormScreen(),
    ),
  ],
);
