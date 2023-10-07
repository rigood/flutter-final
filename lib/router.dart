import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repository.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/auth/views/signup_screen.dart';
import 'package:moodtree/features/auth/views/signin_screen.dart';
import 'package:moodtree/common/main_navigation/views/main_navigation_screen.dart';
import 'package:moodtree/features/post/views/post_screen/post_screen.dart';

enum AppRoute {
  signUp,
  signIn,
  addPost,
  editPost,
}

final routerProvider = Provider(
  (ref) {
    ref.watch(authStateChangesProvider);
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepositoryProvider).isLoggedIn;
        if (!isLoggedIn) {
          if (state.matchedLocation != "/signIn" &&
              state.matchedLocation != "/signUp") {
            return "/signIn";
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: "/signUp",
          name: AppRoute.signUp.name,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: "/signIn",
          name: AppRoute.signIn.name,
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
          path: "/add",
          name: AppRoute.addPost.name,
          builder: (context, state) => const PostScreen(),
        ),
        GoRoute(
            path: "/edit/:id",
            name: AppRoute.editPost.name,
            builder: (context, state) {
              final postId = state.pathParameters['id'];
              final post = state.extra as PostModel?;
              return PostScreen(
                postId: postId,
                post: post,
              );
            })
      ],
    );
  },
);
