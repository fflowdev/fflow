import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DialogFormFields<T> extends StatelessWidget {
  const DialogFormFields({
    super.key,
    required this.title,
    this.validator,
    required this.child,
  });

  final Widget title;
  final FormFieldValidator<T>? validator;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      builder: (field) {
        var titleStyle = context.textTheme.titleMedium ?? const TextStyle();
        if (field.hasError) {
          titleStyle = titleStyle.copyWith(color: context.colorScheme.error);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DefaultTextStyle(
                  style: titleStyle,
                  child: title,
                ),
              ),
            ),
            const Gap(12),
            Flexible(child: child),
          ],
        );
      },
    );
  }
}
