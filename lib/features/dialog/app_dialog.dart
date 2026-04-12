import 'dart:math';

import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.insetPadding,
    this.clipBehavior,
    this.shape,
    this.alignment,
    this.constraints,
    this.scrollable = false,
    this.cancelable = true,
    this.onCancel,
    this.onConfirm,
  });

  AppDialog.text({
    super.key,
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.contentPadding,
    this.contentTextStyle,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.insetPadding,
    this.clipBehavior,
    this.shape,
    this.alignment,
    this.constraints,
    this.scrollable = false,
    this.cancelable = true,
    this.onCancel,
    this.onConfirm,
    required String content,
  }) : content = Text(content);

  final Widget? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final EdgeInsetsGeometry? buttonPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final EdgeInsets? insetPadding;
  final Clip? clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final bool scrollable;

  final bool cancelable;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      icon: icon,
      iconPadding: iconPadding,
      iconColor: iconColor,
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      actions: !cancelable && onCancel == null && onConfirm == null
          ? null
          : [
              if (cancelable)
                TextButton(
                  onPressed: onCancel ?? () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              if (onConfirm != null)
                ElevatedButton(
                  onPressed: onConfirm,
                  child: const Text('OK'),
                ),
            ],
      buttonPadding: buttonPadding,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      semanticLabel: semanticLabel,
      insetPadding: insetPadding,
      clipBehavior: clipBehavior,
      shape: shape,
      alignment: alignment,
      constraints:
          constraints ??
          BoxConstraints(
            maxWidth: min(MediaQuery.sizeOf(context).width * 0.8, 650),
            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
          ),
    );
  }
}
