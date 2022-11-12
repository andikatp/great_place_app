import 'package:flutter/material.dart';
import 'package:greate_place_app/models/place_model.dart';

class GreatPlaceProvider with ChangeNotifier {
  final List<PlaceModel> _items = [];

  List<PlaceModel> get item {
    return [..._items];
  }
}
