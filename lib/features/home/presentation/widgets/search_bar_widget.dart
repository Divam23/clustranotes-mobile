import 'package:clustranotes_mobile/app/theme/theme.dart';

import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget{
  const AppSearchBar({super.key});
  
  @override
  Widget build(BuildContext context){
    return Container(
      child: (
        TextField(
          readOnly: true,
          onTap: (){
            
          },
          decoration: InputDecoration(
            hintText: "Search notes, books, PYQs...",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
              color: Theme.of(context).disabledColor,
            ),
            prefixIcon: Icon(AppIcons.search),
            prefixIconColor: Theme.of(context).disabledColor,
            border: Theme.of(context).inputDecorationTheme.disabledBorder
          )
        )
      ),
    );
  }
}
