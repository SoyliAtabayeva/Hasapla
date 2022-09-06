import 'package:flutter/material.dart';

class ActionsofPage with ChangeNotifier {
  List MyCatagory = [];
  adding(value) {
    MyCatagory.add(value);
    notifyListeners();
  }

  deleting(a) {
    MyCatagory.remove(a);
    notifyListeners();
  }
  
}
