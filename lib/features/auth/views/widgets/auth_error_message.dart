import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class AuthErrorMessage extends ConsumerWidget {
  final Object? error;

  const AuthErrorMessage({
    super.key,
    required this.error,
  });

  String getErrorMessage(error) {
    switch ((error as FirebaseAuthException).code) {
      case "email-already-in-use":
        return "이미 사용 중인 이메일입니다.";
      case "invalid-email":
        return "잘못된 이메일 형식입니다.";
      case "user-not-found":
        return "존재하지 않는 이메일입니다.";
      case "wrong-password":
        return "비밀번호가 일치하지 않습니다.";
      case "INVALID_LOGIN_CREDENTIALS":
        return "이메일 또는 비밀번호가 일치하지 않습니다.";
      default:
        return "오류가 발생했습니다.";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              getErrorMessage(error),
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: ColorThemes.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
