import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/views/signup_screen.dart';
import 'package:moodtree/features/auth/views/signin_screen.dart';
import 'package:moodtree/common/main_navigation/main_navigation_screen.dart';
import 'package:moodtree/features/post/views/post_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: SignUpScreen.routeURL,
      routes: [
        GoRoute(
          path: SignUpScreen.routeURL,
          name: SignUpScreen.routeName,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: SignInScreen.routeURL,
          name: SignInScreen.routeName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: "/:tab(home|calendar|chart|settings)",
          builder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: "/post/:date",
          builder: (context, state) {
            final date = state.pathParameters["date"]!;
            return PostScreen(
              date: date,
            );
          },
        ),
      ],
    );
  },
);
