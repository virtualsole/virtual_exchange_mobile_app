import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic appBottomSheet(Widget child) {
  return Get.bottomSheet(
    child,
    backgroundColor: Theme.of(Get.context!).primaryColorLight,
    isScrollControlled: true,
  );
}
