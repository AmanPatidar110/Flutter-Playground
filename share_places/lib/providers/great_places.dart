import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:share_places/helper/db_helper.dart';
import 'package:share_places/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get getItems {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();

    DBHelper.insertData('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'imagePath': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.fetchData('user_places');
    _items = dataList
        .map((place) => Place(
              id: place['id'],
              title: place['title'],
              image: File(place['imagePath']),
              location: null,
            ))
        .toList();
    notifyListeners();
  }
}
