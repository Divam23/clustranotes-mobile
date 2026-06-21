import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class VerifiedTick extends StatelessWidget{
  final double? size;
  const VerifiedTick({
    this.size = 20,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Icon(
      AppIcons.verified,
      color: AppColors.primary,
      size: size,
    );
  }
}
