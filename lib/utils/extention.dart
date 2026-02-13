import 'dart:core';
import 'package:gap/gap.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math' show pow;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDarkMode => colors.brightness == Brightness.dark;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;
}

extension StringX on String {
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get capitalizeWords {
    final s = trim();
    if (s.isEmpty) return this;

    return s
        .split(RegExp(r'\s+'))
        .map(
          (w) =>
              w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  bool get isEmail => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(this);

  DateTime get toDateTime {
    return DateTime.parse(this);
  }

  DateTime get toSlashDateTime {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.parse(this);
  }

  TimeOfDay get stringDateToTimeOfDay {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(this));
  }

  TimeOfDay get stringToTimeOfDay {
    List<String> timeList = split(':');
    int hour = int.tryParse(timeList.first) ?? 0;
    int min = int.tryParse(timeList.last) ?? 0;
    return TimeOfDay(hour: hour, minute: min);
  }

  double get toCompareDouble {
    TimeOfDay myTime = stringToTimeOfDay;
    return myTime.hour + myTime.minute / 60.0;
  }

  bool get isValidPhone {
    String country = String.fromEnvironment('COUNTRY');
    String phone = '${country.toLowerCase() == 'ghana' ? '+233' : '+233'}$this';
    return PhoneNumber.parse(phone).isValid();
  }

  Color get hexColor {
    return HexColor('${startsWith('#') ? '' : '#'}$this');
  }
}

extension PositionX on Position {
  LatLng get toLatLng2 {
    return LatLng(latitude, longitude);
  }
}

extension DateTimeX on DateTime {
  /// 26/04/2023
  String get dateFormat1 {
    return DateFormat('d/MM/y').format(toTimeZone);
  }

  /// 2023-04-02
  String get dateFormat2 {
    return DateFormat('y-MM-dd').format(toTimeZone);
  }

  /// June 2023
  String get fMonthFYear {
    return DateFormat('MMMM y').format(toTimeZone);
  }

  /// 3
  String get dayNum1 {
    return DateFormat('d').format(toTimeZone);
  }

  /// 03
  String get dayNum2 {
    return DateFormat('dd').format(toTimeZone);
  }

  /// Monday
  String get dayText {
    return DateFormat('EEEE').format(toTimeZone);
  }

  String get ordinalDayAndMonth {
    final dayNum = int.parse(DateFormat('d').format(toTimeZone)); // 1
    final month = DateFormat('MMM').format(toTimeZone); // Jun

    String ordinal;
    if (dayNum >= 11 && dayNum <= 13) {
      ordinal = '${dayNum}th';
    } else {
      switch (dayNum % 10) {
        case 1:
          ordinal = '${dayNum}st';
          break;
        case 2:
          ordinal = '${dayNum}nd';
          break;
        case 3:
          ordinal = '${dayNum}rd';
          break;
        default:
          ordinal = '${dayNum}th';
      }
    }

    return '$ordinal $month';
  }

  String get timeAgo {
    return timeago.format(this);
  }

  String get timeAgoShort {
    return timeago.format(this, locale: 'en_short');
  }

  DateTime get toTimeZone {
    return this;
    // tz.initializeTimeZones();
    // tz.Location location = tz.getLocation(timeZoneLocationName);
    // return tz.TZDateTime.from(this, location);
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}

extension NumX on num {
  num quotient(num divisor) {
    if (this < 1) return 0;
    if (divisor.isInfinite || divisor < 1) return 0;
    return this / divisor;
  }

  num get getSleepInHrs => ((this / 60) * 10).truncate() / 10;

  (num, num) get getSleepTime {
    num hrs = getSleepInHrs.floor();
    num mins = (this / 60 - hrs) * 60;
    return (hrs, mins.ceil());
  }

  double truncateToDecimalPlaces(num fractionalDigits) =>
      (this * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);

  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());

  Gap get gap => Gap(toDouble());
}

extension IntX on int {
  String get to2val {
    return this < 10 ? '0$this' : toString();
  }
}

extension DioExceptionX on DioException {
  String get formattedError {
    if (error is SocketException) {
      return 'Check your internet connection!';
    } else if (error is TimeoutException) {
      return 'Timeout, check your internet connection!';
    } else {
      // Handle different response data structures safely
      final responseData = response?.data;
      if (responseData is Map<String, dynamic>) {
        // Try to get error message from different possible locations
        final errorData = responseData['error'];
        if (errorData is Map<String, dynamic>) {
          return errorData['message']?.toString() ??
              responseData['message']?.toString() ??
              responseData.toString();
        } else if (errorData is String) {
          return errorData;
        } else {
          return responseData['message']?.toString() ?? responseData.toString();
        }
      } else {
        return responseData?.toString() ?? toString();
      }
    }
  }
}

extension MapX on Map<String, dynamic> {
  Map<String, dynamic> get filterOutNulls {
    final Map<String, dynamic> filtered = <String, dynamic>{};
    forEach((String key, dynamic value) {
      if (value != null) {
        filtered[key] = value;
      }
    });
    return filtered;
  }
}

extension WidgetX on Widget {
  Padding get padding24h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: this);

  Padding get padding24v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 24), child: this);

  Padding get padding16h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: this);

  Padding get padding16v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: this);

  Padding get padding14h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: this);

  Padding get padding14v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 14), child: this);

  Padding get padding12h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: this);

  Padding get padding12v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: this);

  Padding get padding10v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: this);

  Padding get padding10h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: this);

  Padding get padding8v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);

  Padding get padding8h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: this);

  Padding get padding6v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: this);

  Padding get padding6h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: this);

  Padding get padding4v =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: this);

  Padding get padding4h =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: this);

  Padding paddingH(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value),
    child: this,
  );

  Padding paddingV(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value),
    child: this,
  );

  Padding paddingT(double value) => Padding(
    padding: EdgeInsets.only(top: value),
    child: this,
  );

  Padding paddingB(double value) => Padding(
    padding: EdgeInsets.only(bottom: value),
    child: this,
  );

  Padding paddingL(double value) => Padding(
    padding: EdgeInsets.only(left: value),
    child: this,
  );

  Padding paddingR(double value) => Padding(
    padding: EdgeInsets.only(right: value),
    child: this,
  );
}
