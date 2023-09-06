import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

void errorSnack(String msg) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 10),
          Text(
            msg,
            style: Theme.of(Get.context!).textTheme.bodySmall,
          ),
        ],
      ),
      backgroundColor: Colors.grey.withOpacity(.4),
    ),
  );
}
