import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Services/HttpServices/api_key.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/custom_form_field.dart';
import 'package:virtual_exchange/Pages/AuthPages/forget_password_page.dart';
import 'package:virtual_exchange/Pages/AuthPages/otp_verification.dart';

import '../../../app_theme.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppButton(
        "Login",
        onTap: () async {
          if (formKey.currentState!.validate()) {
            authProvider.setReasonType(AppKeys().LOGIN_VERIFICATION);

            await authProvider.sendMailForReason().then(
              (value) {
                if (value) {
                  Get.to(
                    () => OtpVerification(forLogin: true),
                  );
                }
              },
            );
          }
        },
      ).paddingAll(20),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const RegistrationPage());
            },
            child: Text(
              "Register",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     border: Border.all(
            //       color: Colors.grey.withOpacity(.3),
            //     ),
            //   ),
            //   child: const Text("Normal Login").paddingSymmetric(horizontal: 10, vertical: 5),
            // ).paddingOnly(bottom: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  "Login With Mobile",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ).paddingOnly(bottom: 5),
            AppFormField(
              hintText: "Please Enter Your Email",
              controller: authProvider.emailCtrl,
              validator: (String? v) {
                if (v!.isEmpty) {
                  return "*Required";
                } else if (!v.isEmail) {
                  return "*invalid email";
                }
                return null;
              },
            ).paddingOnly(bottom: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            AppFormField(
              hintText: "Please Enter Your Password",
              isPasswordField: true,
              controller: authProvider.passwordCtrl,
              validator: (String? v) {
                if (v!.isEmpty) {
                  return "*Required";
                } else if (v.length < 8) {
                  return "* should be 8 characters";
                }
                return null;
              },
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ForgetPasswordPage());
              },
              child: Text(
                "Forget Password?",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.primaryColor),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
