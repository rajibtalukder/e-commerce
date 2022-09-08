import 'package:flutter/material.dart';
class CompleteScreen extends StatelessWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          height:100,
          width:100,
          color:Colors.red,
        )
      ),
    );
  }
}
