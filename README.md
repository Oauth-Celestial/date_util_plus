
# date_util_plus

![Dart](https://img.shields.io/badge/Dart-2.1.0+-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-2.0+-blue.svg)

Simplify your date and time handling with DateUtilPlus for Dart – because managing time shouldn't be a hassle! 🕰️


## Installation

To use Date Utils Plus in your Dart or Flutter project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  date_utils_plus: ^0.0.2 # Use the latest version
```
Run flutter pub get to fetch the package.

Import the necessary package in your Dart file:

```dart
import 'package:date_util_plus/date_util_plus.dart';
```

## Usage 

- **Format Dates Like never Before**

    The **formatServerDateTo** function can format the  date string from server to desired ui format from designer without any hassle.
    ```dart
    String date = "1998-04-29".formatServerDateTo(uiFormat: "29 Dec 1999");

    print(date); // 29 Apr 1998
    
    ```
- **Detect Date format from String**
  ```dart
  String? dateFormat = "September 23, 2023".detectDateFormat();
  print(dateFormat); // MMMM dd, yyyy
    
  ```
- **Calculate Age**
  ```dart
  DateTime birthDate = DateTime(1990, 5, 15);
  int age = birthDate.calculateAge;
  print('Age: $age years'); // Age: 33 years
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

## Feature requests and Bug reports

If you have any suggestions, issues, or contributions in mind, feel free to fork the repository and create a pull request. Your feedback is highly appreciated [here](https://github.com/Oauth-Celestial/date_util_plus/issues).



