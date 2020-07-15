import 'dart:core' as prefix0;
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/FoodDelivery/provider/userp.dart';

// import 'package:food_delivery/FoodDelivery.screen/user_page.dart';
import 'package:food_delivery/FoodDelivery/style/textes_styles.dart';
import 'package:provider/provider.dart';

import 'food_item_page.dart';

class ResturantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturant List'),
        // centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: authProvider.getResturantList(),
//          StreamBuilder<QuerySnapshot>(
//            stream: Firestore.instance.collection('resturants').snapshots(),
//            builder:
//                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//              if (snapshot.hasError)
//                return new Text('Error: ${snapshot.error}');
//              switch (snapshot.connectionState) {
//                case ConnectionState.waiting:
//                  return CircularProgressIndicator(
//                    backgroundColor: Colors.yellow,
//                  );
//                default:
//                  return ListView(
//                    children: snapshot.data.documents
//                        .map((DocumentSnapshot document) {
//                      return Card(
//                        child: ListTile(
//                          leading: Icon(
//                            Icons.restaurant,
//                            size: 64,
//                            color: Color(0xFFF17532),
//                          ),
//                          title: new Text(document['name_resturant'] , FoodDelivery.style: restitle,),
//                          subtitle: new Text(document['location_resturant'] , FoodDelivery.style: ressubtile,),
//                          onTap: (){
//                            Navigator.push(context, MaterialPageRoute(
//                              builder: (context) => CookiePage(docId: document.documentID.toString(),),
//                            ));
//                          },
//                          trailing: Column(
//                            children: <Widget>[
//                              Icon(
//                                Icons.star_border,
//                                size: 32,
//                                color: Color(0xFFF17532),
//                              ),
//                              Text(
//                                '4.3',
//                              ),
//                            ],
//
//                          ),
//                        ),
//
//                      );
//                    }).toList(),
//                  );
//              }
//            },
//          ),
        ),
      ),
    );
  }
}
