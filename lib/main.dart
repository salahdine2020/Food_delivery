//import 'package:flutter/material.dart';
//import 'package:food_delivery/FoodDelivery.provider/userp.dart';
//import 'package:food_delivery/FoodDelivery.screen/register_page.dart';
//import 'package:food_delivery/FoodDelivery.screen/resturantlist_page.dart';
//// import 'package:food_delivery/FoodDelivery.screen/user_page.dart';
//import 'package:FoodDelivery.provider/FoodDelivery.provider.dart';
//import 'FoodDelivery.screen/food_item_page.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  //        ChangeNotifierProvider(
//  //          create: (_) => UserProvider(),
////        ),
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider(
//          create: (_) => UserProvider(),
//        ),
////        ChangeNotifierProvider.value(
////          value: Products(),
////        ),
////        ChangeNotifierProvider.value(
////          value: Cart(),
////        ),
////        ChangeNotifierProvider.value(
////          value: Orders(),
////        ),
//      ],
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primaryColor: Colors.white,
//          accentColor: Colors.yellowAccent
//        ),
//        home: //BottomBar(),
//          RegisterPage(),
//        //ResturantList(),
//        //ProductsOverviewScreen(),
//
////          home: ProductsOverviewScreen(),
////          routes: {
////            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
////            CartScreen.routeName: (ctx) => CartScreen(),
////            OrdersScreen.routeName: (ctx) => OrdersScreen(),
////          }
//      ),
//      );
//  }
//}





import 'package:flutter/material.dart';
import 'package:food_delivery/ResterantItem_added/upload_image.dart';

import 'ResterantItem_added/resturant_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home:
      RestItems(),
      //UploadImage(),
    );
  }
}













// Ecomesource_code




//import 'package:food_delivery/Ecomsource_code/FoodDelivery.models/product.dart';
//import 'package:food_delivery/Ecomsource_code/FoodDelivery.provider/adminMode.dart';
//import 'package:food_delivery/Ecomsource_code/FoodDelivery.provider/cartItem.dart';
//import 'package:food_delivery/Ecomsource_code/FoodDelivery.provider/modelHud.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/OrdersScreen.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/addProduct.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/adminHome.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/editProduct.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/manageProduct.dart';
//import 'package:food_delivery/Ecomsource_code/screens/admin/order_details.dart';
//import 'package:food_delivery/Ecomsource_code/screens/login_screen.dart';
//import 'package:food_delivery/Ecomsource_code/screens/signup_screen.dart';
//import 'package:food_delivery/Ecomsource_code/screens/user/CartScreen.dart';
//import 'package:food_delivery/Ecomsource_code/screens/user/homePage.dart';
//import 'package:food_delivery/Ecomsource_code/screens/user/productInfo.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:FoodDelivery.provider/FoodDelivery.provider.dart';
//
//main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider<ModelHud>(
//          create: (context) => ModelHud(),
//        ),
//        ChangeNotifierProvider<CartItem>(
//          create: (context) => CartItem(),
//        ),
//        ChangeNotifierProvider<AdminMode>(
//          create: (context) => AdminMode(),
//        )
//      ],
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        initialRoute:   HomePage.id,
//        routes: {
//          OrderDetails.id: (context) => OrderDetails(),
//          OrdersScreen.id: (context) => OrdersScreen(),
//          CartScreen.id: (context) => CartScreen(),
//          ProductInfo.id: (context) => ProductInfo(),
//          EditProduct.id: (context) => EditProduct(),
//          ManageProducts.id: (context) => ManageProducts(),
//          LoginScreen.id: (context) => LoginScreen(),
//          SignupScreen.id: (context) => SignupScreen(),
//          HomePage.id: (context) => HomePage(),
//          AdminHome.id: (context) => AdminHome(),
//          AddProduct.id: (context) => AddProduct(),
//        },
//      ),
//    );
//  }
//}



