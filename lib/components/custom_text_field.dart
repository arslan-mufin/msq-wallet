import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final CrossAxisAlignment crossAxisAlignment;
  final bool showUnderline;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final TextCapitalization textCapitalization;

  CustomTextField({
    this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.showUnderline = true,
    this.readOnly = false,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (label != null) Text(label!, style: theme.textTheme.caption),
          TextFormField(
            controller: controller,
            style: theme.textTheme.subtitle1,
            keyboardType: keyboardType,
            initialValue: initialValue,
            textCapitalization: textCapitalization,
            onTap: onTap,
            textAlign: crossAxisAlignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  theme.textTheme.subtitle1!.copyWith(color: theme.hintColor),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: UnderlineInputBorder(
                borderSide: showUnderline
                    ? BorderSide(color: theme.disabledColor, width: 0.5)
                    : BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.disabledColor, width: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
