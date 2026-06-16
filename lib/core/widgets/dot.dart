import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget{
  final double radius;
  final Color color;
  const Dot({
    required this.radius,
    required this.color,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
