import 'package:flutter/material.dart';

class CartList extends StatefulWidget {


  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: Center(
        child: Text("No Item"),
      )

    );
  }
}
