import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';

class BasicRadioListTile<T> extends StatelessWidget {
  const BasicRadioListTile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
    required this.groupValue,
  });

  final Function(T?) onChanged;
  final String title;
  final T value;
  final T groupValue;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        child: RadioListTile<T>(
            title: Text(title),
            value: value,
            activeColor: ColorManager.darkPrimary,
            shape: value == groupValue
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                    side: const BorderSide(
                      width: AppSize.s1,
                      color: ColorManager.navyBlue,
                    ),
                  )
                : null,
            groupValue: groupValue,
            onChanged: onChanged),
      );
}
