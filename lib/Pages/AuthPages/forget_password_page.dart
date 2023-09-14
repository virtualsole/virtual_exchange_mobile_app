import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/custom_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  bool otpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppButton(
        otpSent ? "Submit" : "Send OTP",
        onTap: () {
          if (formKey.currentState!.validate()) {
            authProvider.getUserId().then((value) {
              if (value != null) {
                if (authProvider.getUserIdResponse?.data?.first.userId != null) {
                  authProvider.forgetPassword();
                }
              }
            });
          }
        },
      ).paddingSymmetric(horizontal: 10, vertical: 20),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Reset Password",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold))
                  .paddingOnly(bottom: 20),
              Text(
                "*For Security Purposes, No with draw are permitted for 24 hours after "
                "modifications of security methods",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
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

              AppFormField(
                hintText: "Please Enter New Password",
                controller: authProvider.passwordCtrl,
                validator: (String? v) {
                  if (v!.isEmpty) {
                    return "*Required";
                  } else if (v.length < 8) {
                    return "*password must be 8 characters";
                  }
                  return null;
                },
              ).paddingOnly(bottom: 5),

              // if (otpSent)
              //   PinCodeTextField(
              //     validator: (String? v) {
              //       if (v!.isEmpty)
              //         return "*Required";
              //       else if (v.length < 6) {
              //         return "invalid";
              //       }
              //       ;
              //       return null;
              //     },
              //     appContext: context,
              //     length: 6,
              //     onChanged: (String? value) {},
              //     controller: authProvider.pinCtrl,
              //   ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ),
      ),
    );
  }
}
