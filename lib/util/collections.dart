extension ListUtils<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T item) condition) {
    for (final item in this) {
      if (condition(item)) {
        return item;
      }
    }

    return null;
  }
}
