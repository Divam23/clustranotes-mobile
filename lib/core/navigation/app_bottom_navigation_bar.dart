import 'package:clustranotes_mobile/core/navigation/navigation_item.dart';
import 'package:clustranotes_mobile/core/navigation/navigation_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBottomNavigationBar extends StatelessWidget{
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(
                color: theme.dividerColor.withValues(
                  alpha: 0.3,
                ),
                width: 0.5,
              ),
            ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...navigationItems.asMap().entries.map(
                  (entry) {
                final index = entry.key;
                final item = entry.value;
                final bool isSelected = currentIndex == index;
        
                return Expanded(
                  child: NavigationTab(
                    icon: item.icon,
                    label: item.label,
                    isSelected: currentIndex == index,
                    onTap: () async{
                      if(!isSelected){
                        await HapticFeedback.lightImpact();
                        onTap(index);
                      }
                      
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
