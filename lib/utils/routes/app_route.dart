
import 'package:go_router/go_router.dart';
import 'package:spotifyui/screens/auth/auth_screen.dart';
import 'package:spotifyui/screens/navbar/navbar_screen.dart';
import 'package:spotifyui/screens/search/main_search.dart';
import 'package:spotifyui/screens/splash/splash_screen.dart';

class RouteNames {
  static String splash = '/';
  static String auth = '/auth';
  static String home = '/home';
  static String mainSearch = '/main_search';
  static String navigation = '/navigation';
}


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouteNames.auth,
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: RouteNames.navigation,
      builder: (context, state) {
        return const NavbarScreen();
      },
    ),
    GoRoute(
      path: RouteNames.mainSearch,
      builder: (context, state) {
        return const MainSearch();
      },
    ),
  ],
);