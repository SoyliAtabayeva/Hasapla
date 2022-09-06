import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class SavingStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/savedData.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      debugPrint(contents); 

      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    return file.writeAsString('$counter');
  }
}
