import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class ShowProgress extends StatelessWidget {
  const ShowProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 50,
        child: const CircularProgressIndicator(
          strokeWidth: 1.5,
        ).paddingAll(10),
      ).paddingAll(20),
    );
  }
}

void showProgress() {
  Get.dialog(const ShowProgress());
}

void stopProgress() {
  if (Get.isDialogOpen!) Get.back();
}

void showMessage(String data) {
  bool error = false;
  final jd = json.decode(data);
  String? message = jd["showableMessage"];
  if (message == null) return;
  if (jd["status"] == "fail") {
    error = true;
  }
  Get.snackbar(
    error ? "Error" : "Success",
    message,
    colorText: AppColors.primaryColor,
    margin: EdgeInsets.zero,
    borderRadius: 0.0,
  );
}
