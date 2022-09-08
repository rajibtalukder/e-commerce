import 'package:flutter/material.dart';
class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Order History"),
      ),
      body:
      const Center(
          child: Text('This is order history page'),
        )
    );
  }
}
