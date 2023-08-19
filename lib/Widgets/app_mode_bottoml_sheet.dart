import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';

dynamic appBottomSheet(Widget child) {
  return Get.bottomSheet(
    child,
    backgroundColor: AppColors.themeColor,
    isScrollControlled: true,
  );
}
