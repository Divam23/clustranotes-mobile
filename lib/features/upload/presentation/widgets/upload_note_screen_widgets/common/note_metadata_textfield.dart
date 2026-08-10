import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class NoteMetadataTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? textStyle;
  final int minLines;
  final int maxLines;
  final int minLength;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool required;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const NoteMetadataTextField({
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.minLength = 2,
    this.maxLength,
    this.readOnly = false,
    required this.label,
    this.validator,
    this.hintText,
    this.textStyle,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.autofocus = false,
    this.required = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      enabled: enabled,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textStyle ?? theme.textTheme.bodyLarge,

      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.disabledColor,
              fontSize: 14,
            ),
            children: [
              TextSpan(text: label),
              if (required)
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.disabledColor,
        ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        floatingLabelBehavior: FloatingLabelBehavior.auto,

        filled: true,
        fillColor: theme.colorScheme.surface,

        counterStyle: theme.textTheme.bodySmall,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),

        border: OutlineInputBorder(borderRadius: AppRadius.searchBarSharp),

        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarSharp,
          borderSide: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarSharp,
          borderSide: BorderSide(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarSharp,
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarSharp,
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
        ),
      ),
    );
  }
}
