import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Plugins/PinField/OtpInput/pin_code_fields.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/Providers/AuthProviders/auth_provider.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';

class OtpVerification extends StatelessWidget {
  final bool forLogin;

  OtpVerification({this.forLogin = false, super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<AuthProvider>(
            builder: (BuildContext context, AuthProvider value, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Enter Email Verification Code...",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
              ).paddingOnly(bottom: 30),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "*Required";
                    } else if (v.length < 6) {
                      return "invalid";
                    }

                    return null;
                  },
                  appContext: context,
                  length: 6,
                  onChanged: (String? value) {},
                  controller: value.pinCtrl,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Didn't get OTP? "),
                  TextButton(
                    child: Text(
                      "Resend Code ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ).paddingOnly(bottom: 30),
              AppButton(
                forLogin ? "Login" : "Register",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    /// Register
                    if (!forLogin) {
                      await value.registerUser().then(
                        (value) {
                          if (value) {}
                        },
                      );
                    } else {
                      await value.loginUser().then(
                        (value) {
                          if (value) {}
                        },
                      );
                    }
                  }
                },
              )
            ],
          ).paddingSymmetric(horizontal: 10);
        }),
      ),
    );
  }
}
