import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/theme.dart';

class DateSelectButton extends StatelessWidget {
  final DateTime date;
  final bool disabled;
  final Function changeDate;
  final BuildContext context;

  const DateSelectButton({
    super.key,
    required this.date,
    required this.disabled,
    required this.changeDate,
    required this.context,
  });

  Future<void> _selectDate() async {
    final DateTime? datePicked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorThemes.primary,
              onPrimary: ColorThemes.white,
              onSurface: ColorThemes.black,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: date,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (!context.mounted || datePicked == null) return;

    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorThemes.primary,
              onPrimary: ColorThemes.white,
              onSurface: ColorThemes.black,
            ),
          ),
          child: child!,
        );
      },
      initialTime: TimeOfDay.now(),
    );

    if (timePicked != null) {
      final newDate = DateTime(datePicked.year, datePicked.month,
          datePicked.day, timePicked.hour, timePicked.minute);

      changeDate(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
        ),
        onPressed: disabled ? null : _selectDate,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat('M월 d일 (E) aa h:mm', 'ko').format(date),
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
