import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greate_place_app/helpers/db_helper.dart';
import 'package:greate_place_app/models/place_model.dart';

class GreatPlaceProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final PlaceModel newPlace = PlaceModel(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((e) => PlaceModel(
              id: e['id'],
              title: e['title'],
              image: File(e['image']),
              location: null,
            ))
        .toList();
    notifyListeners();
  }
}
