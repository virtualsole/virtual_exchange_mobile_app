import 'package:flutter/material.dart';

import '../string_and_consts.dart';

// ignore: must_be_immutable
class AppFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final bool isRequiredField;
  final ValueChanged<String?>? onChange;
  final Widget? suffix;
  bool obSecure;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  AppFormField({
    this.controller,
    this.title,
    this.readOnly = false,
    this.onTap,
    this.obSecure = false,
    this.hintText,
    this.hintStyle,
    this.onChange,
    this.validator,
    this.isRequiredField = false,
    this.isPasswordField = false,
    this.suffix,
    this.keyboardType,
    super.key,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            controller: widget.controller,
            onTap: widget.onTap,
            onChanged: widget.onChange,
            cursorColor: AppColors.primaryColor,
            obscureText: widget.obSecure,
            readOnly: widget.readOnly,
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () {
                  widget.obSecure = !widget.obSecure;
                  setState(() {});
                },
                child: (widget.isPasswordField)
                    ? Icon(
                        Icons.remove_red_eye,
                        color: !widget.obSecure ? AppColors.primaryColor : Colors.grey,
                      )
                    : const SizedBox.shrink(),
              ),
              hintText: widget.hintText,
              hintStyle:
                  widget.hintStyle ?? const TextStyle(color: Color(0xffBFBFBF), fontSize: 12),
              isDense: true,
              filled: true,
              fillColor: Theme.of(context).primaryColorLight,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
            ),
          ),
        )
      ],
    );
  }
}
