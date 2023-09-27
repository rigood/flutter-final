import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_final/features/auth/views/signup_screen.dart';
import 'package:flutter_final/features/auth/views/signin_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/signin",
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
      ],
    );
  },
);
