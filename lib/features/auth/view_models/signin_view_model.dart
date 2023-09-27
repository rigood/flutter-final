import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_final/features/auth/repos/auth_repo.dart';

class SingInViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepo.signIn(
        email,
        password,
      );
    });
  }
}

final signInProvider = AsyncNotifierProvider<SingInViewModel, void>(
  () => SingInViewModel(),
);
