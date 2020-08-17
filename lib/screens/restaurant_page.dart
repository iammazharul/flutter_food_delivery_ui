import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';

class RestaurantPage extends StatefulWidget {
  RestaurantPage({this.restaurant});

  final Restaurant restaurant;
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(menuItem.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
                iconSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 220.0,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      iconSize: 30.0,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Theme.of(context).primaryColor,
                      iconSize: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        )),
                    Text('0.2 miles away',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 4.0,
                ),
                Text(widget.restaurant.address,
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Menu',
            style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
