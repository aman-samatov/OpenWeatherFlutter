abstract class BaseDataConverter<R, T> {
  T convert(R response);
}

extension ListConverting<R, T> on List<R> {
  List<T> convertList(BaseDataConverter<R, T> converter) {
    return map((it) => converter.convert(it)).toList();
  }
}
