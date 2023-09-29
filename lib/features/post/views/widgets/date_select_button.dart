import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/theme.dart';

class DateSelectButton extends StatelessWidget {
  final String currentDate;
  final BuildContext context;
  late final DateTime parsedCurrentDate = DateTime.parse(currentDate);

  DateSelectButton({
    super.key,
    required this.currentDate,
    required this.context,
  });

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
            primary: ColorThemes.primary,
            onPrimary: ColorThemes.white,
            onSurface: ColorThemes.black,
          )),
          child: child!,
        );
      },
      context: context,
      initialDate: parsedCurrentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != parsedCurrentDate) {
      final formattedPickedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      if (context.mounted) {
        context.pushReplacement("/post/$formattedPickedDate");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.grey,
        ),
        onPressed: _selectDate,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat('M월 d일 E요일', 'ko').format(parsedCurrentDate),
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: ColorThemes.darkgray,
              ),
            ),
            Gaps.h5,
            const Icon(
              Icons.calendar_month,
              size: Sizes.size18,
              color: ColorThemes.darkgray,
            ),
          ],
        ));
  }
}
