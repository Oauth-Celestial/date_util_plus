

# Installation


# Date Utils Plus

![Dart](https://img.shields.io/badge/Dart-2.1.0+-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-2.0+-blue.svg)
[![Pub](https://img.shields.io/pub/v/date_utils_plus.svg)](https://pub.dev/packages/date_utils_plus)


Date Utils Plus package provides a set of date and time formatting extensions for the DateTime and String classes. These extensions make it easy to format, manipulate, and work with date and time values in your Dart and Flutter applications.

## Key Features

- **Date Formatting:** Format dates with precision using a variety of format options.
- **Age Calculation:** Effortlessly calculate ages based on birthdates and the current date.
- **Date Manipulation:** Add or subtract days, months, years, hours, minutes, or seconds from date objects.
- **Weekday Handling:** Seamlessly handle weekdays, skipping weekends when necessary.
- **String-to-Date Detection:** Automatically detect date formats from strings, simplifying date parsing.
- **Easy Integration:** Quickly integrate Date Utils Plus into your Dart and Flutter projects for enhanced date and time functionality.

## Installation

To use Date Utils Plus in your Dart or Flutter project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  date_utils_plus: ^0.0.1 # Use the latest version
```
Run flutter pub get to fetch the package.

Import the necessary package in your Dart file:

```dart
import 'package:date_util_plus/date_util.dart';
```

## Usage 

### DateTime Formatting

- **Format DateTime as ISO 8601**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
String iso8601 = myDateTime.toIso8601();
print('ISO 8601 Format: $iso8601'); // ISO 8601 Format: 2023-09-23T14:30:00.000
```

- **Format DateTime as Short Date (MM/DD/YYYY)**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
String shortDate = myDateTime.toShortDate();
print('Short Date: $shortDate'); // Short Date: 09/23/2023
```

- **Format DateTime as Long Date (Month DD, YYYY)**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
String longDate = myDateTime.toLongDate();
print('Long Date: $longDate'); // Long Date: September 23, 2023
```

- **Format DateTime as 24-Hour Time (HH:MM:SS)**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
String time24Hour = myDateTime.to24HourTime();
print('24-Hour Time: $time24Hour'); // 24-Hour Time: 14:30:00 // Long Date: September 23, 2023
```

- **Format DateTime as 12-Hour Time with AM/PM (hh:MM:SS AM/PM)**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
String time12Hour = myDateTime.to12HourTime();
print('12-Hour Time: $time12Hour'); // 12-Hour Time: 02:30:00 PM
```

- **Calculate Age**
```dart
DateTime birthDate = DateTime(1990, 5, 15);
int age = birthDate.calculateAge;
print('Age: $age years'); // Age: 33 years
```

- **Adding and Subtracting Time**
```dart
DateTime myDateTime = DateTime(2023, 9, 23, 14, 30);
DateTime futureDate = myDateTime.addDays(5);
DateTime pastDate = myDateTime.subtractDays(2); 
```


- **Weeks in Month**
```dart
DateTime myDateTime = DateTime(2023, 9, 23);
int weeksInMonth = myDateTime.weeksInMonth();
print('Weeks in Month: $weeksInMonth'); // Weeks in Month: 4 
```

- **Detect Date format from String**
```dart
    String? dateFormat = "September 23, 2023".detectDateFormat();
  
    print(dateFormat); // MMMM dd, yyyy
   
```



- **Format date with reference**
```dart
    String? dateFormat = "September 23, 2023".detectDateFormat();
    String? formattedDate =
        DateTime.now().formatDate(likeGiven: "September 23, 2023");
    print(dateFormat); // MMMM dd, yyyy
    print(formattedDate);  //September 24, 2023
```




