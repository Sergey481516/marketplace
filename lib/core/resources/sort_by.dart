class SortBy {
  final String key;
  final String? value;

  const SortBy(this.key, this.value);

  @override
  String toString() {
    if (value == null) {
      return key;
    }

    return '${key}_$value';
  }
}
