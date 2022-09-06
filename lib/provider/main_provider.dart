import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:newpro/models/activity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  Activities activities = Activities([]);
  void addActivity(Activity activity) async {
    activities.all.add(activity);
    // writeData(activities.toJson());
    final shared = await sharedPreferences;
    shared.setString('activities', activities.toJson());
    debugPrint(activities.toJson());
    notifyListeners();
  }

  void deleteActivity(int id) {
    activities.all.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/savedData.txt');
  }

  Future readActivities() async {
    try {
      // final file = await _localFile;

      // final contents = await file.readAsString();
      // debugPrint(contents);
      final shared = await sharedPreferences;
      final data = shared.getString('activities');
      if (data != null) {
        activities = Activities.fromJson(data);
      }
      notifyListeners();
    } catch (e) {
      print(e);
      print('error ');
    }
  }

  Future<File> writeData(String data) async {
    print('store data');
    final file = await _localFile;

    return file.writeAsString(data);
  }
}
