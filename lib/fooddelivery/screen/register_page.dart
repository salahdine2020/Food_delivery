import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/FoodDelivery/provider/userp.dart';
import 'package:food_delivery/FoodDelivery/provider/userp.dart';
import 'package:food_delivery/FoodDelivery/screen/resturantlist_page.dart';

//import 'package:food_delivery/FoodDelivery.screen/user_page.dart';
import 'package:provider/provider.dart';

import '../Widgets/botto_bar.dart';

// Create a Form widget.
class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() {
    return RegisterPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class RegisterPageState extends State<RegisterPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String loc;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Text('FoodDelivery',FoodDelivery.style: TextStyle(color: Colors.yellow),),
//        centerTitle: true,
//      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 64,
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Food Delivery',
                        style:
                            TextStyle(color: Color(0xFFF17532), fontSize: 48),
                      )),
                ),
                SizedBox(
                  height: 48,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(0xFFF17532),
                  ),
                  title: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Nom Complet ex: Mohammed Salah",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 18,
                ),
                // Radio to chose between male & female

                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Color(0xFFF17532),
                    ),
                    title: TextFormField(
                      controller: authProvider.phone,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "phone ex: 0656375516",
                      ),
                      validator: (value) {
                        if (value.isEmpty && value.length <= 10) {
                          return 'Please enter the correct number';
                        }
                        return null;
                      },
                    ),
                  ),

                SizedBox(
                  height: 18,
                ),

                  ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      color: Color(0xFFF17532),
                    ),
                    title: TextFormField(
                      controller: authProvider.location,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        hintText:
                            "location ex: Oueled Ben Saber, Maghnia , Tlemcen ",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.my_location,
                        color: Color(0xFFF17532),
                      ),
                      onPressed: () {
                        // authProvider.location = authProvider.getAddressFromLatLng();
                        // print(authProvider.getlocation());
                        authProvider.getlocation();
                        authProvider.getAddressFromLatLng();
                      },
                    ),
                  ),

                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RaisedButton(
                      color: Color(0xFFF17532),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          authProvider.signUp();
                          authProvider.clearController();
//                        Scaffold.of(context).showSnackBar(SnackBar(
//                            content: Text(
//                          'Processing Data',
//                          style: TextStyle(color: Colors.yellow),
//                        )));

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomBar(),
                              ));
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
