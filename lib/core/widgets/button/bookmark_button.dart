import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppBookmarkButton extends StatelessWidget{
  final VoidCallback onPressed;

  const AppBookmarkButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: AppRadius.searchBarSharp,
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(
            context,
          ).dividerColor.withValues(alpha: 0.3),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadius.searchBarSharp,
          onTap: () {},
          child: const SizedBox(
            height: 35,
            width: 35,
            child: Center(
              child: Icon(
                AppIcons.bookmark,
                size: 20,
              ),
            ),
          ),
        ),
      )
    );
  }
}
