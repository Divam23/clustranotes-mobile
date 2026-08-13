import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget{
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
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
  final bool obscureText;
  final String? Function(String?)? validator;
  const AuthTextField({
    required this.keyboardType,
    required this.controller,
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
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.autofocus = false,
    this.required = true,
    this.obscureText = false,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
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
      obscureText: obscureText,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.disabledColor,
              fontSize: 14,
              fontWeight: FontWeight.w400
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
        enabled: enabled,
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.disabledColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,

        filled: true,
        fillColor: AppColors.transparent,

        counterStyle: theme.textTheme.bodySmall,
        
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        
        border: OutlineInputBorder(
          borderRadius: AppRadius.searchBarRounded, 
          borderSide: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 0
          )
        ),
        isDense: true,
        isCollapsed: true,
        errorMaxLines: 2,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarRounded,
          borderSide: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 0
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarRounded,
          borderSide: BorderSide(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            width: 0,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarRounded,
          borderSide: BorderSide(color: theme.colorScheme.error, width: 0.2),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBarRounded,
          borderSide: BorderSide(color: theme.colorScheme.error, width: 0.2),
        ),
      ),
    );
  }
}
