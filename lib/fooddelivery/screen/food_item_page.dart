import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/FoodDelivery/screen/food_item_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/FoodDelivery/screen/cart_list.dart';

import '../models/product.dart';

class CookiePage extends StatefulWidget {
  String docId;
  String ResturantName = 'Resturant Exampl';

  CookiePage({this.docId, this.ResturantName});

  @override
  _CookiePageState createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  //bool buy = false;
  // List<bool> buy_l = [];
  bool clicked = false;
  String newd;
  int ci;
  Color c;
  List<dynamic> li = [];
  List<dynamic> nli = [];
  handlItem(int i, AsyncSnapshot snapshot) async {
    print(i);
    //addItem();
    setState(() {
      clicked = !clicked;
      ci = i;
      print(ci);
    });
    clicked == false
        ? await Firestore.instance.collection('shope').add(
            {
              'name_f': snapshot.data.documents[i]['name_food'],
              'price_f': snapshot.data.documents[i]['price'],
              'cnt': 1,
              'added': 'Added',
            },
          ).then(
            (value) {
              String doc = value.documentID.toString();
              print(doc);
              setState(() {
                newd = doc;
              });
            },
          )
        : Firestore.instance
            .collection('shope')
            .document(newd)
            .delete()
            .then((_) {
            print('deleted');
          });
  }

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
            widget.ResturantName,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.shopping_basket, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartList(),
                  ));
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFFCFAF8),
      body:
      StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('resturants')
            .document(widget.docId)
            .collection('items')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            // circler Progres Indicator Wifget
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFF17532),
                ),
              );
            default:
              return Container(
                padding: EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8,
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Color(0xFFF17532),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CookieDetail(
                                    assetPath:
                                    'assets/images/cookieclassic.jpg',
                                    cookiename: document['name_food'],
                                    cookieprice: document['price'],
                                    cookiedetaille: document['item_detaille'],
                                  ),
                                ));
                            print('click to go into detaille Page');
                          },
                          child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/cookieclassic.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Column(
                          children: <Widget>[
                            Text(document['name_food'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Varela',
                                    fontSize: 14.0)),
                            Text(document['price'],
                                style: TextStyle(
                                    color: Color(0xFF575E67),
                                    fontFamily: 'Varela',
                                    fontSize: 14.0)),
                          ],
                        ),
                        //Divider(),
                        // Inkwell to add some food to your cart
                        InkWell(
                          onTap: () {
                            // code to add Item in card
                            //getData();
                            print('Click to Add In Cart');
                            //getDataInf(widget.docId);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFF17532), size: 24.0),
                              Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Colors.black,
                                    fontSize: 12.0),
                              ),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () async {
                                   String nf = document['name_food'].toString();
                                   String pr = document['price'].toString();
                                   String idet = document['item_detaille'].toString();
                                   List<String> clc = [nf,pr,idet];
                                   li.add(
                                       clc,
                                   );
                                   print(li);
                                  }),
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                  ).toList(),
                ),
              );
          }
        },
      ),

    );
  }
}
