import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';

class BasicListTile<T> extends StatelessWidget {
  const BasicListTile({
    super.key,
    required this.title,
    required this.leading,
    required this.onPress,
    this.titleTextStyle,
  });

  final String title;
  final Widget leading;
  final Function()? onPress;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        child: ListTile(
          onTap: onPress,
          leading: leading,
          title: Text(title,style: titleTextStyle,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            side: const BorderSide(
              width: AppSize.s1,
              color: ColorManager.navyBlue,
            ),
          ),
        ),
      );
}
