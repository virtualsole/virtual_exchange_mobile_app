// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/custom_form_field.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showReferralId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor,
                    ),
              ))
        ],
      ),
      body: SingleChildScrollView(
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
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ).paddingOnly(bottom: 5),
            AppFormField(hintText: "Please Enter Your Email").paddingOnly(bottom: 5),
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
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showReferralId = !showReferralId;
                });
              },
              child: Row(
                children: [
                  const Text('Referral ID (Optional)'),
                  SvgPicture.asset(
                    !showReferralId ? ImageRes.arrowDown : ImageRes.arrowUp,
                    color: Colors.white,
                    height: 10,
                    width: 10,
                  ),
                ],
              ).paddingOnly(top: 10),
            ),
            if (showReferralId)
              AppFormField(
                hintText: "Please Enter Referral ID",
              ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AppButton(
                "Register",
                onTap: () {},
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
