import 'package:flutter/material.dart';
class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("Card"),
        ),
        body:
        const Center(
          child: Text('This is order Card page'),
        )
    );
  }
}