import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  /// Format DateTime as ISO 8601
  String toIso8601() {
    return toIso8601String();
  }

  /// Format DateTime as Short Date: MM/DD/YYYY
  String toShortDate() {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/$year';
  }

  /// Format DateTime as Long Date: Month DD, YYYY
  String toLongDate() {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${monthNames[month - 1]} ${day}, ${year}';
  }

  /// Format DateTime as 24-Hour Time: HH:MM:SS
  String to24HourTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }

  /// Format DateTime as 12-Hour Time with AM/PM: hh:MM:SS AM/PM
  String to12HourTime() {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} $period';
  }

  /// addDays(): Adds a specified number of days to a DateTime.
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// subtractDays(): Subtracts a specified number of days from a DateTime.
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// addMonths(): Adds a specified number of months to a DateTime.
  DateTime addMonths(int months) {
    return DateTime(year, month + months, day, hour, minute, second,
        millisecond, microsecond);
  }

  /// subtractMonths(): Subtracts a specified number of months from a DateTime.
  DateTime subtractMonths(int months) {
    return DateTime(year, month - months, day, hour, minute, second,
        millisecond, microsecond);
  }

  /// addYears(): Adds a specified number of years to a DateTime.
  DateTime addYears(int years) {
    return DateTime(year + years, month, day, hour, minute, second, millisecond,
        microsecond);
  }

  /// subtractYears(): Subtracts a specified number of years from a DateTime.
  DateTime subtractYears(int years) {
    return DateTime(year - years, month, day, hour, minute, second, millisecond,
        microsecond);
  }

  /// addSeconds(): Adds a specified number of seconds to a DateTime.
  DateTime addSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  /// subtractSeconds(): Subtracts a specified number of seconds from a DateTime.
  DateTime subtractSeconds(int seconds) {
    return subtract(Duration(seconds: seconds));
  }

  /// addMilliseconds(): Adds a specified number of milliseconds to a DateTime.
  DateTime addMilliseconds(int milliseconds) {
    return add(Duration(milliseconds: milliseconds));
  }

  /// subtractMilliseconds(): Subtracts a specified number of milliseconds from a DateTime.
  DateTime subtractMilliseconds(int milliseconds) {
    return subtract(Duration(milliseconds: milliseconds));
  }

  /// addHours(): Adds a specified number of hours to a DateTime.
  DateTime addHours(int hours) {
    return add(Duration(hours: hours));
  }

  /// subtractHours(): Subtracts a specified number of hours from a DateTime.
  DateTime subtractHours(int hours) {
    return subtract(Duration(hours: hours));
  }

  ///addMinutes(): Adds a specified number of minutes to a DateTime.
  DateTime addMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  /// subtractMinutes(): Subtracts a specified number of minutes from a DateTime.
  DateTime subtractMinutes(int minutes) {
    return subtract(Duration(minutes: minutes));
  }

  /// weeksInMonth(): Calculates the number of weeks in the month of a DateTime.
  int weeksInMonth() {
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    int daysInMonth = lastDayOfMonth.day;

    int daysRemaining = daysInMonth - firstDayOfMonth.weekday + 1;
    int weeks = (daysRemaining / 7).ceil();

    return weeks;
  }

// Adds a specified number of weekdays (skipping weekends) to a DateTime.
  DateTime addWeekdaysBySkippingWeekends(int daysToAdd) {
    DateTime result = this;

    while (daysToAdd > 0) {
      result = result.add(Duration(days: 1));
      if (result.weekday == DateTime.saturday ||
          result.weekday == DateTime.sunday) {
        continue; // Skip weekends
      }
      daysToAdd--;
    }

    return result;
  }

  /// The calculateAge property calculates the age of a person based on their birthdate.
  /// It takes the current date into account and returns the person's age in years.
  int get calculateAge {
    final today = DateTime.now();
    int age = today.year - year;

    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  }

  /// formatDate(): Formats a DateTime object using a specified format string.
  /// The likeGiven parameter is used to provide a format hint, and the function detects the appropriate format based on the string's contents.
  String? formatDate({required String likeGiven}) {
    String dateFormat = likeGiven.detectDateFormat() ?? "dd-MM-yyyy";
    String formattedDate = DateFormat(dateFormat).format(this);
    return formattedDate;
  }
}

extension DateEx on String {
  String? detectDateFormat() {
    Map<String, String> regexWithFormat = {
      r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}': "yyyy-MM-dd HH:mm:ss",
      r'\w{3}, \w{3} \d{1,2}, \d{2}': "EEE, MMM d, 'yy",
      r'\w+ \d{1,2}, \d{4}': "MMMM dd, yyyy",
      r'\d{2}/\d{2}/\d{4}': "MM/dd/yyyy",
      r'\d{2}-\d{2}-\d{4}': "dd-MM-yyyy",
      r'\d{2}:\d{2} [APap][Mm]': "hh:mm a",
      r'\w+ \d{4}': "MMMM yyyy",
      r'\w{3}, \d{1,2} \w{3} \d{4}': "EEE, dd MMM yyyy HH:mm:ss",
      r'\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}': "dd/MM/yyyy HH:mm:ss",
      r'\d{4}-\d{2}-\d{2}': "yyyy-MM-dd", //(Date only)
      r'\d{1,2} \w{3} \d{4}': " d MMM yyyy", // (e.g., 22 Sep 2023)
      r'\w{3}, \d{1,2} \w{3} \d{2}': "EEE, d MMM 'yy", //(e.g., Fri, 22 Sep '23)
      r'\d{2}:\d{2}': "HH:mm", // (Time only)
      r'\d{1,2}/\d{1,2}/\d{2}': "M/d/yy", // (e.g., 9/22/23)
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}': "yyyy-MM-ddTHH:mm:ss",
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z': "yyyy-MM-ddTHH:mm:ssZ"
    };

    for (final entry in regexWithFormat.entries) {
      final regex = RegExp(entry.key);
      if (regex.hasMatch(this)) {
        return entry.value;
      }
    }

    return null;
  }
}
