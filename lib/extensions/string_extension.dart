
part of '../date_util_plus.dart';
extension DateEx on String {
  String? detectDateFormat() {
    Map<String, String> regexWithFormat = {
  r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}': "yyyy-MM-dd HH:mm:ss", // Example: 2022-01-14 12:34:56
  r'\w{3}, \w{3} \d{1,2}, \d{2}': "EEE, MMM d, 'yy", // Example: Fri, Jan 14, '22
  r'\w+ \d{1,2}, \d{4}': "MMMM dd, yyyy", // Example: January 14, 2022
  r'\d{2}/\d{2}/\d{4}': "MM/dd/yyyy", // Example: 01/14/2022
  r'\d{2}-\d{2}-\d{4}': "dd-MM-yyyy", // Example: 14-01-2022
  r'\d{2}:\d{2} [APap][Mm]': "hh:mm a", // Example: 12:34 PM
  r'\w+ \d{4}': "MMMM yyyy", // Example: January 2022
  r'\w{3}, \d{1,2} \w{3} \d{4}': "EEE, dd MMM yyyy HH:mm:ss", // Example: Fri, 14 Jan 2022 12:34:56
  r'\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}': "dd/MM/yyyy HH:mm:ss", // Example: 14/01/2022 12:34:56
  r'\d{4}-\d{2}-\d{2}': "yyyy-MM-dd", // Example: 2022-01-14 (Date only)
  r'\d{1,2} \w{3} \d{4}': "d MMM yyyy", // Example: 22 Sep 2023
  r'\w{3}, \d{1,2} \w{3} \d{2}': "EEE, d MMM 'yy", // Example: Fri, 22 Sep '23
  r'\d{2}:\d{2}': "HH:mm", // Example: 12:34 (Time only)
  r'\d{1,2}/\d{1,2}/\d{2}': "M/d/yy", // Example: 9/22/23
  r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}': "yyyy-MM-ddTHH:mm:ss", // Example: 2022-01-14T12:34:56
  r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z': "yyyy-MM-ddTHH:mm:ssZ", // Example: 2022-01-14T12:34:56Z
  r'^\d{4}-\d{2}-\d{2}$': 'yyyy-MM-dd', // Example: 2022-01-14
  r'^\d{2}/\d{2}/\d{4}$': 'MM/dd/yyyy', // Example: 01/14/2022
  r'^\d{2}\.\d{2}\.\d{4}$': 'MM.dd.yyyy', // Example: 01.14.2022
  r'^\d{2}\s\d{2}\s\d{4}$': 'MM dd yyyy', // Example: 01 14 2022
  r'^\d{4}/\d{2}/\d{2}$': 'yyyy/MM/dd', // Example: 2022/01/14
  r'^\d{4}\.\d{2}\.\d{2}$': 'yyyy.MM.dd', // Example: 2022.01.14
  r'^\d{4}\s\d{2}\s\d{2}$': 'yyyy MM dd', // Example: 2022 01 14
  r'^\d{2}-\d{2}-\d{4}$': 'dd-MM-yyyy', // Example: 14-01-2022
  r'^\d{2}/\d{2}/\d{2}$': 'dd/MM/yy', // Example: 14/01/22
  r'^\d{2}\.\d{2}\.\d{2}$': 'dd.MM.yy', // Example: 14.01.22
  r'^\d{2}\s\d{2}\s\d{2}$': 'dd MM yy', // Example: 14 01 22
  r'^\d{4}-\d{1,2}-\d{1,2}$': 'yyyy-M-d', // Example: 2022-1-14
  r'^\d{2}/\d{1,2}/\d{1,2}$': 'MM/d/yy', // Example: 01/1/22
  r'^\d{2}\.\d{1,2}\.\d{1,2}$': 'MM.d.yy', // Example: 01.1.22
  r'^\d{2}\s\d{1,2}\s\d{1,2}$': 'MM d yy', // Example: 01 1 22
  r'^\d{1,2}-\d{1,2}-\d{4}$': 'd-M-yyyy', // Example: 14-1-2022
  r'^\d{1,2}/\d{1,2}/\d{4}$': 'd/M/yyyy', // Example: 14/1/2022
  r'^\d{1,2}\.\d{1,2}\.\d{4}$': 'd.M.yyyy', // Example: 14.1.2022
  r'^\d{1,2}\s\d{1,2}\s\d{4}$': 'd M yyyy', // Example: 14 1 2022
  r'^\d{1,2} \w+ \d{4}$': 'd MMMM yyyy', // Example: 29 April 1999
  r'^\d{1,2} \w{3} \d{4}$': 'dd MMM yyyy', // Example: 29 Apr 1999
  r'^\d{8}$': 'yyyyMMdd', // Example: 20220114
  r'^\d{6}$': 'yyMMdd', // Example: 220114
};

  String? finalPattern;
List<String> patternsFound = [];

    for (final entry in regexWithFormat.entries) {
      final regex = RegExp(entry.key);
      if (regex.hasMatch(this)) {
        // return entry.value;
        patternsFound.add(entry.value);
      }
    }
    if(patternsFound.isNotEmpty && patternsFound.length >1 ){
    for ( String pattern in patternsFound){
      bool  validatePattern = validateDatePattern(this, expected: this, pattern: pattern);
      if(validatePattern){
        finalPattern = pattern;
        break;
      }
    }
    }
    else{
      if(patternsFound.isNotEmpty){
        finalPattern = patternsFound[0];
      }
    }

    return finalPattern;
  }

  DateTime getDateFromString({String pattern = "dd-MM-yyyy"}){
    DateFormat dateFormat = DateFormat(pattern);

  // Parse the date string
  DateTime dateTime = dateFormat.parse(this);

  return dateTime;
  }

  bool validateDatePattern(String dateString, {String pattern = "yyyy-MM-dd HH:mm:ss", required String expected}) {
  try {
    DateTime dateTime = DateFormat(pattern).parse(dateString);
    String formattedDate = DateFormat(pattern).format(dateTime);
    return formattedDate == expected;
  } catch (e) {
    return false;
  }
}

  formatServerDateTo({ required  String uiFormat , String fallBackFormat = "dd-MM-yyyy" }){
    String detectedDateFormat =uiFormat.detectDateFormat() ?? fallBackFormat;
    DateTime date = DateTime.parse(this);
     DateFormat outputFormat = DateFormat(detectedDateFormat);
     String result = outputFormat.format(date);
    return  result;
  }

}

