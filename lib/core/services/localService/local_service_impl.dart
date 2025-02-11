import 'package:hive_flutter/hive_flutter.dart';

import 'local_service.dart';

class HiveLocalStorageService extends LocalStorageService {
  late Box _box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('local_storage_box');
  }

  @override
  Future<bool> isExists({required String key}) async {
    return _box.containsKey(key);
  }

  @override
  dynamic read({required String key}) {
    return _box.get(key);
  }

  @override
  Future<void> write({required String key, required dynamic value}) async {
    await _box.put(key, value);
  }

  @override
  Future<void> clear({required String key}) async {
    await _box.delete(key);
  }

  @override
  Future<void> clearAll() async {
    await _box.clear();
  }

  @override
  Future<void> delete({required String key, required data}) {
    try {
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }
}
