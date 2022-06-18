import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? firstChild;
  final Widget secondChild;
  final Widget? upperContent;
  final bool isBgColored;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? secondChildPadding;
  final bool yellowGradient;

  CustomScaffold({
    required this.appBar,
    required this.firstChild,
    required this.secondChild,
    this.upperContent,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.isBgColored = true,
    this.backgroundColor,
    this.secondChildPadding,
    this.yellowGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar != null
          ? PreferredSize(preferredSize: Size.fromHeight(68), child: appBar!)
          : null,
      body: Column(
        children: [
          if (upperContent != null) upperContent!,
          Expanded(
            child: FadedSlideAnimation(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  gradient: yellowGradient
                      ? LinearGradient(
                          colors: [theme.primaryColor, Color(0xffFAA72A)])
                      : LinearGradient(
                          colors: [
                            isBgColored
                                ? theme.primaryColorLight
                                : theme.cardColor,
                            isBgColored
                                ? theme.primaryColorDark
                                : theme.cardColor,
                          ],
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (firstChild != null)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: firstChild,
                      ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40)),
                          color: theme.backgroundColor,
                        ),
                        padding: secondChildPadding ??
                            EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: secondChild,
                      ),
                    )
                  ],
                ),
              ),
              beginOffset: Offset(0.0, 0.2),
              endOffset: Offset.zero,
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerFloat,
    );
  }
}
