import 'package:intl/intl.dart';

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

