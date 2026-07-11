import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteMetadataDropdown<T> extends ConsumerWidget {
  final String label;
  final T? value;
  final String? hintText;
  final String Function(T value) itemLabelBuilder;
  final VoidCallback onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final bool enabled;
  final bool required;
  final bool autofocus;
  final bool readOnly;
  const NoteMetadataDropdown({
    required this.label,
    required this.onTap,
    required this.itemLabelBuilder,

    this.value,
    this.hintText,
    this.enabled = true,
    this.required = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.readOnly = false,
    this.autofocus = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.read(uploadProvider);
    return InkWell(
      borderRadius: AppRadius.card,
      onTap: enabled ? onTap : null,

      child: InputDecorator(
        decoration: InputDecoration(
          errorText: upload.university == null ? errorText : null,

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
                    text: ' *',
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
  }
}
