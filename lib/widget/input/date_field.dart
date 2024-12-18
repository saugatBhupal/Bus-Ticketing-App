import 'package:bus_ticketing_app/util/auto_hypen_formattor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateField extends StatelessWidget {
  final TextEditingController? dobController;
  final String? hintText;

  const DateField({
    super.key,
    this.dobController,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dobController,
      keyboardType: TextInputType.datetime,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: const Color(0xFF716C6C),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\- ]')),
        AutoHyphenFormatter(),
        LengthLimitingTextInputFormatter(10),
      ],
      style: const TextStyle(
        color: Color(0xFF0D0D52),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText ?? 'DD - MM - YYYY',
        hintStyle: const TextStyle(
          color: Color(0xFF0D0D52),
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Departure",
        labelStyle: const TextStyle(
          color: Color(0xFF716C6C),
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFBEB6B6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFBEB6B6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFBEB6B6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFC31818),
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Date Required";
        }
        final regex = RegExp(r'^\d{2}\s?-\s?\d{2}\s?-\s?\d{4}$');
        if (!regex.hasMatch(val)) {
          return "Invalid Date";
        }
        final parts = val.split(RegExp(r'\s?-\s?'));
        if (parts.length != 3) {
          return "Invalid Date";
        }
        final day = int.tryParse(parts[0]);
        final month = int.tryParse(parts[1]);
        final year = int.tryParse(parts[2]);

        print("$day / $month / $year");
        final currentYear = DateTime.now().year;
        if (day == null || day < 1 || day > 31) {
          return 'Invalid day. Day should be between 01 and 31';
        }
        if (month == null || month < 1 || month > 12) {
          return 'Invalid month. Month should be between 01 and 12';
        }
        if (year == null || year > currentYear) {
          return 'Invalid year. Year cannot be greater than the current year';
        }
        if ((month == 4 || month == 6 || month == 9 || month == 11) &&
            day > 30) {
          return 'This month has only 30 days';
        }
        if (month == 2) {
          final isLeapYear =
              (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
          if (day > 29 || (day == 29 && !isLeapYear)) {
            return 'February has only 28 days or 29 days in a leap year';
          }
        }
        final selectedDate = DateTime(year, month, day);
        final currentDate = DateTime.now();
        if (selectedDate.isBefore(currentDate) ||
            selectedDate.isAfter(currentDate.add(const Duration(days: 7)))) {
          return 'Date should be between today and 7 days from now';
        }
        return null;
      },
    );
  }
}
