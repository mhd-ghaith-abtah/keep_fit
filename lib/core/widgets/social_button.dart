import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/core/utils/enums.dart';
import 'package:keep_fit/core/widgets/social_button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  /// Here are the buttons builder which integrate with button builder
  /// and the buttons list.
  ///
  /// The `SignInButton` class already contains general used buttons.
  /// In case of other buttons, user can always use `SocialButtonBuilder`
  /// to build the signin button.
  /// onPressed function should be passed in as a required field.
  final Function onPressed;

  /// button should be used from the enum class `Buttons`
  final Buttons button;

  /// mini is a boolean field which specify whether to use a square mini button.
  final bool mini;

  /// shape is to specify the custom shape of the widget.
  final ShapeBorder? shape;

  /// overrides the default button text
  final String? text;

  /// overrides the default button padding
  final EdgeInsets padding;

  /// overrides the default button elevation
  final double elevation;

  /// The constructor is fairly self-explanatory.
  const SocialButton(
    this.button, {
    Key? key,
    required this.onPressed,
    this.mini = false,
    this.padding = const EdgeInsets.all(0),
    this.shape,
    this.text,
    this.elevation = 2.0,
  }) : super(key: key);

  /// The build function is used to build the widget which will switch to
  /// desired widget based on the enum class `Buttons`
  @override
  Widget build(BuildContext context) {
    switch (button) {
      case Buttons.instagram:
        return SocialButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Instagram'),
          mini: mini,
          text: text ?? 'Sign in with Instagram',
          icon: FontAwesomeIcons.instagram,
          iconColor: ColorManager.darkPrimary ,
          backgroundColor: ColorManager.navyBlue,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.facebook:
        return SocialButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Facebook'),
          mini: mini,
          text: text ?? 'Sign in with Facebook',
          icon: FontAwesomeIcons.facebookF,
          iconColor: ColorManager.darkPrimary,
          backgroundColor: ColorManager.navyBlue,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.whatsApp:
        return SocialButtonBuilder(
          elevation: elevation,
          key: const ValueKey('WhatsApp'),
          mini: mini,
          text: text ?? 'Sign in with WhatsApp',
          icon: FontAwesomeIcons.whatsapp,
          iconColor: ColorManager.darkPrimary,
          backgroundColor: ColorManager.navyBlue,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.phone:
        return SocialButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Phone'),
          mini: mini,
          text: text ?? 'Sign in with Phone',
          icon: FontAwesomeIcons.phone,
          iconColor: ColorManager.darkPrimary,
          backgroundColor: ColorManager.navyBlue,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.mobile:
        return SocialButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Mobile'),
          mini: mini,
          text: text ?? 'Sign in with Mobile',
          icon: FontAwesomeIcons.mobileScreen,
          iconColor: ColorManager.darkPrimary,
          backgroundColor: ColorManager.navyBlue,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
    }
  }
}
