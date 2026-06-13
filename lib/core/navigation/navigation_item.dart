import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class NavigationItem {
  final String label;
  final IconData icon;

  const NavigationItem({
    required this.label, 
    required this.icon
  });
}

const navigationItems = [
  NavigationItem(
      label: "Home", 
      icon: AppIcons.home,
  ),
  NavigationItem(
      label: "Explore", 
      icon: AppIcons.search
  ),
  NavigationItem(
      label: "Upload", 
      icon: AppIcons.upload
  ),
  NavigationItem(
      label: "Library", 
      icon: AppIcons.library
  ),
  NavigationItem(
      label: "Profile", 
      icon: AppIcons.profile
  )
  
];
