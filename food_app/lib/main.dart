import 'package:flutter/material.dart';
import 'package:food_app/providers/sign_in_provider.dart';
import 'package:food_app/screens/Initial/initial_screen.dart';
import 'package:food_app/screens/ItemDetails/item_details_screen.dart';
import 'package:food_app/screens/LoginScreen/login_screen.dart';
import 'package:food_app/tabs.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/initial', // default is '/'
      routes: {
        '/initial': (ctx) => InitialScreen(),
        // '/tabs': (ctx) => Tabs(),
        // '/signIn': (ctx) => LoginScreen(),
        '/itemDetails': (ctx) => ItemDetails(),
        // CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        // MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
