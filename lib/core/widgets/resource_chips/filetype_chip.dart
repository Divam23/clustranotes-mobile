import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:flutter/material.dart';


class AppFileTypeChips {
  static final pdf = AppChipItem(
    chipName: "PDF",
    radius: AppRadius.chip,
    color: const Color(0xFFE53935),
  );

  static final doc = AppChipItem(
    chipName: "DOC",
    radius: AppRadius.chip,
    color: const Color(0xFF1E88E5),
  );
  
  static final docx = AppChipItem(
    chipName: "DOCX",
    radius: AppRadius.chip,
    color: const Color(0xFF1E88E5),
  );

  static final ppt = AppChipItem(
    chipName: "PPT",
    radius: AppRadius.chip,
    color: const Color(0xFFFB8C00),
  );
  
  static final pptx = AppChipItem(
    chipName: "PPTX",
    radius: AppRadius.chip,
    color: const Color(0xFFFB8C00),
  );

 
  static final Map<String, AppChipItem> allFileTypes = {
    'pdf': pdf,
    'doc': doc,
    'docx': docx,
    'ppt': ppt,
    'pptx': pptx,
  };
}

