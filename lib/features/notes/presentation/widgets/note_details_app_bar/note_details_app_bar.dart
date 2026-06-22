import 'package:clustranotes_mobile/core/widgets/button/bookmark_button.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class NoteDetailsAppBar extends StatelessWidget{
  const NoteDetailsAppBar({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(AppIcons.back),
            ),
          ),
          Row(
            children: [
              AppBookmarkButton(onPressed: (){}),
              PopupMenuButton<String>(
                elevation: 4,
                onSelected: (value) {},
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'share',
                    child: Text('Share'),
                  ),
                  const PopupMenuItem(
                    value: 'report',
                    child: Text('Report'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
