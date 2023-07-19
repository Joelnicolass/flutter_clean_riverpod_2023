import 'package:go_router/go_router.dart';
import 'package:socialgeneric/core/external/router/screens.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: TodoScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
