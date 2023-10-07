import 'package:flutter/material.dart';
import 'package:moodtree/constants/sizes.dart';

class AuthInputSuffix extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;

  const AuthInputSuffix({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: Sizes.size16,
      ),
    );
  }
}
