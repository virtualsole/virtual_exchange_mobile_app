import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BoxRadius on BoxDecoration {
  BoxDecoration boxRadius(double radius, Color? color) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius));
  }
}

extension Listner on Widget {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }
}

extension DateToString on DateTime? {
  String toFormattedDate() {
    if (this == null) {
      return "";
    }

    String day = this!.day.toString().padLeft(2, '0');
    String month = this!.month.toString().padLeft(2, '0');
    String year = this!.year.toString();
    return '$day-$month-$year';
  }

  String toFormattedTime() {
    if (this == null) {
      return "";
    }

    String hour = this!.hour.toString().padLeft(2, '0');
    String minute = this!.minute.toString().padLeft(2, '0');
    String period = this!.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String toFormattedDateAndTime() {
    final weekday = DateFormat('E').format(this!);
    final day = DateFormat('dd').format(this!);
    final month = DateFormat('MM').format(this!);
    final year = DateFormat('yyyy').format(this!);
    final time = DateFormat('hh:mm a').format(this!);

    return '$weekday, $day-$month-$year $time';
  }
}

extension AlphabetSubstring on String? {
  String? get substring15 {
    final cleanedString = this?.replaceAll(RegExp('[^a-zA-Z]'), '');
    if (cleanedString == null) return "";
    return cleanedString.length <= 10 ? cleanedString : "${cleanedString.substring(0, 15)}....";
  }

  String? get subStringName {
    final cleanedString = this?.replaceAll(RegExp('[^a-zA-Z]'), '');
    if (cleanedString == null) return "";
    return cleanedString.length <= 10 ? cleanedString : "${cleanedString.substring(0, 10)}...";
  }
}
