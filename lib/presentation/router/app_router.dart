import 'package:go_router/go_router.dart';
import 'package:price_app/presentation/screens/deals/deals_screen.dart';
import 'package:price_app/presentation/screens/home/homepage_screen.dart';
import 'package:price_app/presentation/screens/home/profile_screen.dart';
import 'package:price_app/presentation/screens/home/saved_screen.dart';
import 'package:price_app/presentation/screens/vendor/index_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return IndexScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomePageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/saved',
                builder: (context, state) => const SavedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/deals',
                builder: (context, state) => const DealsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
