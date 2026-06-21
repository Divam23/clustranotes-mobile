import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class NoteDescriptionSection extends StatefulWidget {
  final String description;
  const NoteDescriptionSection({required this.description, super.key});

  @override
  State<NoteDescriptionSection> createState() => _NoteDescriptionSectionState();
}

class _NoteDescriptionSectionState extends State<NoteDescriptionSection> {
  bool _isExpanded = false;
  _toggleExpandedDescription() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.screenPadding),
      decoration: BoxDecoration(),
      child: Column(
        spacing: AppSpacing.md,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'DESCRIPTION',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSecondary,
            ),
          ),
          Column(
            children: [
              Text(
                widget.description,
                maxLines: _isExpanded ? null : 3,
                overflow: _isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSecondary,
                ),
              ),
              ?widget.description.length > 120
                ? TextButton(
                    onPressed: _toggleExpandedDescription,
                      child: Text(_isExpanded ? "Show less" : "Show more"),
                    )
                : null,
            ],
          ),
        ],
      ),
    );
  }
}
