import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool autoFocus;

  const AppSearchBar({
    super.key,
    this.onTap,
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.searchBar
      ),
      child: (
        TextField(
          readOnly: readOnly,
          onTap: onTap,
          autofocus: autoFocus,
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Search notes, books, PYQs...",
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.disabledColor,
            ),
            prefixIcon: Icon(AppIcons.search),
            prefixIconColor: Theme.of(context).disabledColor,
            border: theme.inputDecorationTheme.disabledBorder,
          ),
      )),
    );
  }
}
