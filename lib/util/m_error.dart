class MustSetBuilderException implements Exception {
  String toString() =>
      "If you set the valueObxListener, you must set the builder function.";
}

class NotSupportObxListenerException implements Exception {
  String toString() => "[NotSupportObxListenerException] Not support";
}

class OnlyBuilderException implements Exception {
  final String fieldName;

  OnlyBuilderException(this.fieldName);

  String toString() =>
      "You can not use $fieldName and builder in same time, please use only one of them.";
}
