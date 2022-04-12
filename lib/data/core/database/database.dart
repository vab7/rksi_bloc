abstract class Database<T> {
  Future<T?> getData({required String boxName, required String key});

  void saveData(
      {required String boxName, required String key, required T value});
}
