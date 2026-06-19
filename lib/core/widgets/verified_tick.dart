import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class VerifiedTick extends StatelessWidget{
  const VerifiedTick({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Icon(
      AppIcons.verified,
      color: AppColors.primary,
      size: 20,
    );
  }
}
