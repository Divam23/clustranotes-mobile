import 'package:flutter/cupertino.dart';

class AppErrorScreen extends StatelessWidget{
  final String message;
  final bool? retryable;
  const AppErrorScreen({required this.message, this.retryable, super.key});
  
  @override
  Widget build(BuildContext context){
    return Container();
  }
}
