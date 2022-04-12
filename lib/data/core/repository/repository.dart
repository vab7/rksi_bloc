abstract class Repository<T> {
  Future<List<T>> getRepository({String? type, String? index, String? item});
}
