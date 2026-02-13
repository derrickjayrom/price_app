import 'package:go_router/go_router.dart';
import 'package:price_app/presentation/screens/home/homepage_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePageScreen()),
    ],
  );
}
