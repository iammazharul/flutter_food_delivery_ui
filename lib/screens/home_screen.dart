import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.account_circle), iconSize: 30.0, onPressed: (){},),
        title: Text('Food Delivery'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text('Cart (${currentUser.cart.length})', style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),),
          )
        ],
      ),
    );
  }
}
