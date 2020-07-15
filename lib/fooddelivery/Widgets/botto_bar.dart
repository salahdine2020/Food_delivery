import 'package:flutter/material.dart';
import 'package:food_delivery/FoodDelivery/provider/cartItem.dart';
import 'package:food_delivery/FoodDelivery/provider/cartItem.dart';
import 'package:food_delivery/FoodDelivery/provider/userp.dart';
import 'package:food_delivery/FoodDelivery/screen/cart_list.dart';
import 'package:food_delivery/FoodDelivery/screen/profile_page.dart';
import 'package:food_delivery/FoodDelivery/screen/resturantlist_page.dart';
import 'package:provider/provider.dart';

import '../provider/cartItem.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
   static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   List<Widget> _widgetOptions = <Widget>[
    ResturantList(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CartList(),
          ));
          // authProvider.setInf();
          //cartItem.addProduct(product);
        },
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.shopping_basket),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  }

