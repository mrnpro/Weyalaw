abstract class LocalStorageService {
  Future<void> init();
  Future<bool> isExists({required String key});
  read({required String key});
  Future<void> write({required String key, required dynamic value});
  Future<void> delete({required String key, required dynamic data});
  Future<void> clear({required String key});
  Future<void> clearAll();
}
