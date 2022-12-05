class OptionalModel<Type> {
  OptionalModel([this.value]);

  Type? value;

  bool isEmpty() {
    return value == null;
  }

  bool isPresent() {
    return value != null;
  }

  void clear() {
    value = null;
  }
}
