import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteMetadataDropdown<T> extends ConsumerWidget {
  final String label;
  final T? value;
  final String? hintText;
  final String Function(T value) itemLabelBuilder;
  final Future<T?> Function(BuildContext context)? picker;
  final ValueChanged<T> onChanged;
  final VoidCallback? onCleared;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final bool enabled;
  final bool required;
  final bool autofocus;
  final bool readOnly;
  final bool allowClear;
  final String? Function(T?)? validator;
  const NoteMetadataDropdown({
    required this.label,
    required this.picker,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.onCleared,

    this.value,
    this.hintText,
    this.enabled = true,
    this.required = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.validator,
    this.readOnly = false,
    this.autofocus = false,
    this.allowClear = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return FormField<T>(
      initialValue: value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      builder: (field) {
        return InkWell(
          borderRadius: AppRadius.card,
          onTap: enabled
              ? () async {
                  final selected = await picker!(context);
                  if (selected == null) {
                    if (allowClear && field.value != null) {
                      field.didChange(null);
                      onCleared?.call();
                    }
                    return;
                  }
                  if (selected != field.value) {
                    field.didChange(selected);
                    onChanged(selected);
                  }
                }
              : null,

          child: InputDecorator(
            decoration: InputDecoration(
              errorText: field.errorText,
              label: RichText(
                text: TextSpan(
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.disabledColor,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(text: label),
                    if (required)
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon:
                  suffixIcon ?? const Icon(Icons.keyboard_arrow_down_rounded),

              floatingLabelBehavior: FloatingLabelBehavior.auto,

              filled: true,
              fillColor: theme.colorScheme.surface,

              counterStyle: theme.textTheme.bodySmall,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),

              border: OutlineInputBorder(
                borderRadius: AppRadius.searchBarSharp,
              ),

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
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              value == null ? (hintText ?? '') : itemLabelBuilder(value as T),
              style: value == null
                  ? theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)
                  : theme.textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
