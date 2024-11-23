import 'package:shared_preferences/shared_preferences.dart';
import 'package:town_square/infrastructure/services/key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    try {
      final prefs = await getSharedPrefs();
      switch (T) {
        case int:
          return prefs.getInt(key) as T?;
        case String:
          return prefs.getString(key) as T?;
        case bool:
          return prefs.getBool(key) as T?;
        default:
          throw UnimplementedError(
              "Get no está implementado para el tipo ${T.runtimeType}");
      }
    } catch (e) {
      throw Exception("Error al obtener el valor de SharedPreferences: $e");
    }
  }

  @override
  Future<Set<String>> getAllKeys() async {
    try {
      final prefs = await getSharedPrefs();
      return prefs.getKeys();
    } catch (e) {
      throw Exception("Error al obtener las claves de SharedPreferences: $e");
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    try {
      final prefs = await getSharedPrefs();
      return await prefs.remove(key);
    } catch (e) {
      throw Exception("Error al eliminar la clave: $e");
    }
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    try {
      final prefs = await getSharedPrefs();
      switch (T) {
        case int:
          await prefs.setInt(key, value as int);
          break;
        case String:
          await prefs.setString(key, value as String);
          break;
        case bool:
          await prefs.setBool(key, value as bool);
          break;
        default:
          throw UnimplementedError(
              "Set no está implementado para el tipo ${T.runtimeType}");
      }
    } catch (e) {
      throw Exception("Error al guardar el valor en SharedPreferences: $e");
    }
  }
}
