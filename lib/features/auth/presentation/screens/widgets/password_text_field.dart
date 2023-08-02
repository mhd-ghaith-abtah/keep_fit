import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      style: getRegularTextStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      obscureText: obscurePassword,
      decoration: InputDecoration(
        label: Text(
          AppStrings.password.tr(),
          style: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
        ),
        hintStyle: getThinTextStyle(
          color: Colors.white54,
          fontSize: FontSize.s10,
        ),
        hintText: AppStrings.passwordHint.tr(),
        prefixIcon: const Icon(
          Icons.password_rounded,
          color: ColorManager.darkPrimary,
        ),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            obscurePassword = !obscurePassword;
          }),
          child: Icon(
            !obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: obscurePassword ? Colors.white54 : ColorManager.darkPrimary,
          ),
        ),
      ),
    );
  }
}
