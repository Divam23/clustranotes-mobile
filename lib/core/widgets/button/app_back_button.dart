import 'package:clustranotes_mobile/app/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget{
  const AppBackButton({super.key});
  
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {
          context.pop();
        },
        icon: Icon(AppIcons.back),
      ),
    );
  }
}
