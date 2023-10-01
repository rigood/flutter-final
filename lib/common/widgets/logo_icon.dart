import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/theme.dart';

class LogoIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const LogoIcon({
    super.key,
    this.icon = FontAwesomeIcons.pagelines,
    required this.size,
    this.color = ColorThemes.primary,
  });

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      size: size,
      color: color,
    );
  }
}
