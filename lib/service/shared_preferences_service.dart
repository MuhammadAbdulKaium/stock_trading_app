import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService{
  late SharedPreferences _prefs;

  Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // String
  void saveString(String key, String value) => _prefs.setString(key, value);
  String getString(String key, [String defaultValue = '']) => _prefs.getString(key) ?? defaultValue;
  
  // Integer
  void saveInt(String key, int value) => _prefs.setInt(key, value);
  int getInt(String key, [int defaultValue = 0]) => _prefs.getInt(key) ?? defaultValue;
  
  // Boolean
  void saveBool(String key, bool value) => _prefs.setBool(key, value);
  bool getBool(String key, [bool defaultValue = false]) => _prefs.getBool(key) ?? defaultValue;

  // Double
  void saveDouble(String key, double value) => _prefs.setDouble(key, value);
  double getDouble(String key, [double defaultValue = 0.0]) => _prefs.getDouble(key) ?? defaultValue;
  
  // String List
  void saveStringList(String key, List<String> value) => _prefs.setStringList(key, value);
  List<String> getStringList(String key, [List<String> defaultValue = const []]) => _prefs.getStringList(key) ?? defaultValue;

  // Remove data
  void remove(String key) => _prefs.remove(key);

  // Clear all data
  void clear() => _prefs.clear();
}