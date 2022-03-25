import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_places/providers/great_places.dart';
import 'package:share_places/screens/add_place_screen.dart';
import 'package:share_places/screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatePlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme(
            primary: Colors.indigo,
            primaryVariant: Colors.indigo.shade400,
            secondary: Colors.amber,
            secondaryVariant: Colors.amberAccent,
            surface: Colors.white,
            background: Colors.indigo,
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.amber,
            onSurface: Colors.white,
            onBackground: Colors.amber,
            onError: Colors.amber,
            brightness: Brightness.light,
          ),
        ),
        home: PlacesListScreen(),
        routes: {
          'add-place': (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
