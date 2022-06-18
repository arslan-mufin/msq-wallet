import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class Buttons {
  ///circular button
  static Widget circularButton(
    BuildContext context,
    Widget child,
    GestureTapCallback? onTap, {
    double? height,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Theme.of(context).cardColor),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  ///custom button
  static Widget customButton(
    BuildContext context, {
    required GestureTapCallback? onTap,
    String? text,
    String? image,
    IconData? icon,
    bool isBgColored = true,
    bool isIconGradient = false,
    Color? iconColor,
    Color? textColor,
    double? iconSize,
    bool yellowGradient = false,
  }) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: FadedScaleAnimation(
        child: Container(
          height: 52,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: yellowGradient
                ? LinearGradient(
                    colors: [Color(0xffFAA72A), theme.primaryColor])
                : LinearGradient(
                    colors: [
                      isBgColored ? theme.primaryColorLight : theme.cardColor,
                      isBgColored ? theme.primaryColorDark : theme.cardColor,
                    ],
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) Image.asset(image, height: 20),
              if (icon != null)
                if (isIconGradient)
                  ShaderMask(
                    shaderCallback: AppTheme.shaderCallback,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  )
                else
                  Icon(icon, color: iconColor, size: iconSize),
              if (image != null || icon != null) SizedBox(width: 8),
              Expanded(
                child: Text(
                  (text ?? S.of(context).continueText).toUpperCase(),
                  style: theme.textTheme.caption?.copyWith(
                      color: textColor ??
                          (image != null || icon != null && !isBgColored
                              ? theme.textSelectionTheme.cursorColor
                              : Colors.white),
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
