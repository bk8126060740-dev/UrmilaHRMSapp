import 'dart:developer';
import 'package:hive_flutter/adapters.dart';

import '../../../app/auth/model/login_response_model.dart';

class HiveService {
  static late Box box;
  static late Box box2;

  static bool _initialized = false;

  static Future<void> init() async {
    if (!_initialized) {
      await Hive.initFlutter();

      // Register adapters
      Hive.registerAdapter(LoginResponseAdapter());
      // Hive.registerAdapter(UserAdapter());

      box = await Hive.openBox('box');
      box2 = await Hive.openBox('box2');

      _initialized = true;
    }
  }

  static dynamic read(dynamic key) {
    if (!_initialized) {
      throw Exception('HiveService has not been initialized.');
    }
    var data = box.get(key);
    log('$key: $data');
    return data;
  }

  static Future<void> write(dynamic key, dynamic value) async {
    if (!_initialized) {
      throw Exception('HiveService has not been initialized.');
    }
    await box.put(key, value);
  }

  static void close() {
    box.close();
  }

  static clear() {
    box.clear();
  }

  static dynamic readBox2(dynamic key) {
    var data = box2.get(key);
    log('$key: $data');
    return data;
  }

  static Future<void> writeBox2(dynamic key, dynamic value) async {
    await box2.put(key, value);
  }

  static void closeBox2() {
    box2.close();
  }

  static void clearBox2() {
    box2.clear();
  }
}
