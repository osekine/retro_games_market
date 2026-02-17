import 'package:shared_preferences/shared_preferences.dart';

import 'i_data_service.dart';

class LocalDataService implements IDataService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _instance async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> save(Object id, Object? value) async {
    final prefs = await _instance;
    final key = id.toString();

    if (value == null) {
      await prefs.remove(key);
      return;
    }

    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw UnsupportedError(
        'Type ${value.runtimeType} is not supported by SharedPreferences',
      );
    }
  }

  @override
  Future<T?> load<T>(Object id) async {
    final prefs = await _instance;
    final key = id.toString();


    final value = prefs.get(key);

    if (value is T) {
      return value;
    }

    return null;
  }
}
