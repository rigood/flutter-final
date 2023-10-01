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
      initialDate: date,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      changeDate(pickedDate);
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
