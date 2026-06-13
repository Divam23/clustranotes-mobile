import 'package:clustranotes_mobile/core/navigation/app_bottom_navigation_bar.dart';
import 'package:clustranotes_mobile/features/explore/presentation/pages/explore_screen.dart';
import 'package:clustranotes_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:clustranotes_mobile/features/library/presentation/pages/library_screen.dart';
import 'package:clustranotes_mobile/features/profile/presentation/pages/profile_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_screen.dart';
import 'package:flutter/material.dart';

class AppNavigationShell extends StatefulWidget{
  const AppNavigationShell({super.key});
  
  @override
  State<AppNavigationShell> createState() => _AppNavigationShellState();
}

class _AppNavigationShellState extends State<AppNavigationShell> {
  
  int currentIndex = 0;
  
  final pages = [
    HomeScreen(),
    ExploreScreen(),
    UploadScreen(),
    LibraryScreen(),
    ProfileScreen()
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });    
        }
      ),
    );
  }
}
