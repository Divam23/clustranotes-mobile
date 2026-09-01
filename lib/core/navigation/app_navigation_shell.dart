import 'package:clustranotes_mobile/core/navigation/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationShell extends StatelessWidget{
  final StatefulNavigationShell navigationShell;
  
  const AppNavigationShell({required this.navigationShell, super.key});

  
  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: ((didPop, result) {
        if(didPop){
          return;
        }
        if(navigationShell.currentIndex != 0){
          navigationShell.goBranch(0, initialLocation: true);
        }
      }),
      child: Scaffold(
        body: navigationShell,
        
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index){
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex
            );
          },
        ),
      ),
    );
  }
}
