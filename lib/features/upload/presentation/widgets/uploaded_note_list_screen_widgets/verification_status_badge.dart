import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class VerificationStatusBadge extends StatelessWidget{
  final Color color;
  final String chipName;
  const VerificationStatusBadge({required this.color, required this.chipName, super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical:AppSpacing.xxs,horizontal:AppSpacing.sm),
      constraints: const BoxConstraints(minHeight: 20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.4),
        borderRadius: AppRadius.chip,
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          chipName,
          style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
