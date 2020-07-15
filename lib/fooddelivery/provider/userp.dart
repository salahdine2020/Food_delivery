import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/FoodDelivery/style/textes_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../screen/food_item_detail.dart';
import '../screen/food_item_page.dart';

class UserProvider with ChangeNotifier {
  Firestore firestore = Firestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  String namei, favorites, age, food, color, subject;
  Position position;
  String currentAddress;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  getlocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    notifyListeners();
    // print(position);
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = p[0];
      currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      var pst = currentAddress.toString();
      location.text = pst;
      notifyListeners();
      print(currentAddress);
      return pst;
    } catch (e) {
      notifyListeners();
      print(e);
    }
  }

  Future<bool> signUp() async {
    try {
      firestore.collection('users').document().setData({
        'name': name.text,
        'phone': phone.text,
        'location': location.text,
      });
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  void clearController() {
    name.text = "";
    phone.text = "";
    location.text = "";
  }

  getResturantList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('resturants').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            );
          default:
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/resturantpic.jpg'),
                    title: new Text(
                      document['name_resturant'],
                      style: restitle,
                    ),
                    subtitle: new Text(
                      document['location_resturant'],
                      style: ressubtile,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CookiePage(
                              docId: document.documentID.toString(),
                              ResturantName: document['name_resturant'],
                            ),
                          ));
                      notifyListeners();
                    },
                    trailing: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 32,
                          color: Color(0xFFF17532),
                        ),
                        Text(
                          '4.3',
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }

  getItemsfromResturant(String documentforId,  Widget circleP) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('resturants')
          .document(documentforId)
          .collection('items')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            // circler Progres Indicator Wifget
            return circleP;
          default:
            return Container(
              padding: EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
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
                        padding: EdgeInsets.all(5.0),
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
                                  assetPath: 'assets/images/cookieclassic.jpg',
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
                              image:
                                  AssetImage('assets/images/cookieclassic.jpg'),
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
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Container(color: Color(0xFFEBEBEB), height: 1.0)),
                      // Inkwell to add some food to your cart
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: InkWell(
                          onTap: () {
                            // code to add Item in card

                            print('Click to Add In Cart');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFF17532), size: 12.0),
                              Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Colors.black,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );
                }).toList(),
              ),
            );
        }
      },
    );
  }

  void setInf() async {
    await firestore.collection("info").document().setData({
      'favorites': {'food': "Pizza", 'color': "Blue", 'subject': "Recess"},
    });
    notifyListeners();
  }

}
