// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/Providers/AuthProviders/auth_provider.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/custom_form_field.dart';
import 'package:virtual_exchange/Pages/AuthPages/otp_verification.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (BuildContext context, AuthProvider value, Widget? child) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AppButton(
            "Get OTP",
            onTap: () async {
              if (formKey.currentState!.validate()) {
                await authProvider.sendEMailOTPForRegistration().then((value) {
                  if (value) Get.to(() => OtpVerification());
                });
              }
            },
          ),
        ).paddingSymmetric(vertical: 20, horizontal: 10),
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text("Register",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold))
                      .paddingOnly(bottom: 20),
                  const SizedBox(height: 20),
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
                        "Register With Mobile",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ).paddingOnly(bottom: 5),
                  AppFormField(
                    hintText: "Please Enter Your Email",
                    controller: value.authIdCtrl,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "*Required";
                      } else if (!value.isEmail) {
                        return "invalid email";
                      }

                      return null;
                    },
                  ).paddingOnly(bottom: 5),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  AppFormField(
                    hintText: "Please Enter Your Password",
                    controller: value.passwordCtrl,
                    isPasswordField: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "*Required";
                      } else if (value.length < 8) {
                        return "should be 8 characters";
                      } else if (value != authProvider.repeatPasswordCtrl.text) {
                        return "password mismatch";
                      }

                      return null;
                    },
                  ),
                  Text(
                    "Repeat Password",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  AppFormField(
                    hintText: "Repeat Password",
                    controller: value.repeatPasswordCtrl,
                    isPasswordField: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "*Required";
                      } else if (value != authProvider.passwordCtrl.text) {
                        return "password mismatch";
                      }

                      return null;
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 10)),
        ),
      );
    });
  }
}
