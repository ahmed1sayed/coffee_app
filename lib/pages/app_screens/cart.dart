import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container (
        color: Colors.orange,
        height: 200,
        child:  const Text('cccccccccccccccc'),),
    );
  }
}
