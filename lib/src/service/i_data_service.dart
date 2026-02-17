abstract interface class IDataService {
  Future<void> save(Object id, Object? value);
  Future<T?> load<T>(Object id);
}
