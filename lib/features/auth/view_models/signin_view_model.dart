import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repository.dart';

class SignInViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({required String email, required String password}) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
        () => authRepository.signIn(email: email, password: password));
  }
}

final signInProvider = AsyncNotifierProvider<SignInViewModel, void>(
  () => SignInViewModel(),
);
