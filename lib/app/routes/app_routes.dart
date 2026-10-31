import 'package:go_router/go_router.dart';

import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/rusunawa/detail_rusunawa_screen.dart';
import '../../presentation/screens/review/review_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String detailRusunawa = '/detail-rusunawa';
  static const String review = '/review';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: detailRusunawa,
        builder: (context, state) => const DetailRusunawaScreen(),
      ),
      GoRoute(path: review, builder: (context, state) => const ReviewScreen()),
    ],
  );
}
