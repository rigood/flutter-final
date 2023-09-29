import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repo.dart';

class SingUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepo.signUp(
        email,
        password,
      );
    });
  }
}

final signUpProvider = AsyncNotifierProvider<SingUpViewModel, void>(
  () => SingUpViewModel(),
);
