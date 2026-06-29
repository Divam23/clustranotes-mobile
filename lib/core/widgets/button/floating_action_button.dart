import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget{
  final VoidCallback onTap;
  const AppFloatingActionButton({required this.onTap, super.key});
  
  @override
  Widget build(BuildContext context){
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.full),
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(AppRadius.full)
        ),
        child: Center(
          child: Icon(
            AppIcons.plus,
            size: 35,
          ),
        ),
      ),
    );
  }
}
