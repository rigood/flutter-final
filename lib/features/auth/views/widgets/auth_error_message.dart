import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_final/theme.dart';
import 'package:flutter_final/constants/sizes.dart';
import 'package:flutter_final/common/widgets/expanded_text.dart';

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
          ExpandedText(
              text: getErrorMessage(error),
              textStyle: const TextStyle(
                color: ColorThemes.red,
              ))
        ],
      ),
    );
  }
}
