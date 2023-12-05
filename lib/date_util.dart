import 'package:intl/intl.dart';
part 'date_ext.dart';


extension DateTimeFormatting on DateTime {
  /// Format DateTime as ISO 8601
  String toIso8601() {
    return toIso8601String();
  }

  bool isSameDate({ required  DateTime date2}) {
  return year == date2.year && month == date2.month && day == date2.day;
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
    return '${monthNames[month - 1]} $day, $year';
  }

  /// Format DateTime as 24-Hour Time: HH:MM:SS
  String to24HourTime({bool includeSeconds = false}) {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}${includeSeconds ? second.toString().padLeft(2, '0'): ""}' ;
  }

  /// Format DateTime as 12-Hour Time with AM/PM: hh:MM:SS AM/PM
  String to12HourTime({bool includeSeconds = false}) {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${includeSeconds ? second.toString().padLeft(2, '0'): ""} $period';
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

   bool isFutureDate() {
    final currentTime = DateTime.now();
    return isAfter(currentTime);
  }

  
   bool isPastDate() {
    final currentTime = DateTime.now();
    return isBefore(currentTime);
  }

  String formatWithPattern({String pattern = "dd-MM-yyyy"}) {
    final DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.format(this);
  }



  int differenceInMonth({ required DateTime endDate}){
    
    Duration difference = this.difference(endDate);
     int months = (difference.inDays % 365) ~/ 30;

     return months;

  }

    int differenceInYear({ required DateTime endDate}){
    
    Duration difference = this.difference(endDate);
      int years = difference.inDays ~/ 365;

     return years;

  }

  bool isLeapYear() {
    int year = this.year;

    if (year % 4 != 0) {
      /// Not divisible by 4, not a leap year
      return false;
    } else if (year % 100 != 0) {
      /// Divisible by 4 but not by 100, it is a leap year
      return true;
    } else if (year % 400 != 0) {
      /// Divisible by 100 but not by 400, not a leap year
      return false;
    } else {
      /// Divisible by 400, it is a leap year
      return true;
    }
  }

  int differenceInDays({ required   DateTime endDate}){
  Duration difference = this.difference(endDate);
  int days = difference.inDays % 30;
  return days;
  }


     bool isFirstDayOfMonth() {
    return isSameDay(firstDayOfMonth(this), this);
  }

   bool isLastDayOfMonth() {
    return isSameDay(lastDayOfMonth(this), this);
  }

    static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    a = DateTime.utc(a.year, a.month, a.day);
    b = DateTime.utc(b.year, b.month, b.day);

    var diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    var min = a.isBefore(b) ? a : b;
    var max = a.isBefore(b) ? b : a;
    var result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

   DateTime firstDayOfWeek() {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
   var givenDay  = DateTime.utc(year, month, day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    var decreaseNum =givenDay.weekday % 7;
    return givenDay.subtract(Duration(days: decreaseNum));
  }

   DateTime lastDayOfWeek() {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
  var likeGiven = DateTime.utc(year, month, day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    var increaseNum = likeGiven.weekday % 7;
    return likeGiven.add(Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }


    static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

   List<DateTime> daysInMonth() {
    var first = firstDayOfMonth(this);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = DateUtils.lastDayOfMonth(this);

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
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




  DateTime getDateFromString({String pattern = "dd-MM-yyyy"}){
    DateFormat dateFormat = DateFormat(pattern);

  // Parse the date string
  DateTime dateTime = dateFormat.parse(this);

  return dateTime;
  }

}
