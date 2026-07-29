import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class DeclarationCheckbox extends StatelessWidget{
  final bool value;
  final ValueChanged onChanged;
  final String statement;
  const DeclarationCheckbox({
    required this.value,
    required this.onChanged,
    required this.statement,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Row(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value, 
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          activeColor: AppColors.warning,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(text: statement),
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
