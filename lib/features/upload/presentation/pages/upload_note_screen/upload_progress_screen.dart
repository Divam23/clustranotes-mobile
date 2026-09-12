import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_screen_header.dart';
import 'package:flutter/material.dart';

class UploadProgressScreen extends StatelessWidget{
  const UploadProgressScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            UploadProgressScreenHeader(),
            
          ],
        ),
      )),
    );
  }
}
