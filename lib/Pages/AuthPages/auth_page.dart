import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Plugins/Flutter_Icons/lib/flutter_icons.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Services/HttpServices/api_key.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/custom_form_field.dart';
import 'package:virtual_exchange/Pages/AuthPages/forget_password_page.dart';
import 'package:virtual_exchange/Pages/AuthPages/otp_verification.dart';
import 'package:virtual_exchange/string_and_consts.dart';

import '../../../app_theme.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool loginWithMobile = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loginWithMobile ? "Mobile" : "Email",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    authProvider.authIdCtrl.clear();
                    loginWithMobile = !loginWithMobile;
                    setState(() {});
                  },
                  child: Text(
                    loginWithMobile ? "Login With Email" : "Login With Mobile",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ).paddingOnly(bottom: 5),
            AppFormField(
              hintText: "Please Enter Your Email",
              controller: authProvider.authIdCtrl,
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.primaryColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      authProvider.signInWithGoogle();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.3))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            ImageRes.googlePng,
                            scale: 20,
                          ),
                          Text("Google",
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ).paddingSymmetric(vertical: 10),
                    ).paddingOnly(right: 20),
                  ),
                ),
                if (Platform.isIOS)
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.3))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            ImageRes.applePng,
                            scale: 20,
                          ),
                          Text("Apple",
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ).paddingSymmetric(vertical: 10),
                    ),
                  )
              ],
            ).paddingOnly(top: 20)
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }

  void validation(String value) {
    if (value.isEmail) {
    } else if (value.isPhoneNumber) {
    } else {
      return;
    }
  }
}
