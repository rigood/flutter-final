import 'package:flutter/material.dart';
import 'package:flutter_final/constants/sizes.dart';

class InputSuffix extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const InputSuffix({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Icon(
        icon,
        size: Sizes.size16,
      ),
    );
  }
}
