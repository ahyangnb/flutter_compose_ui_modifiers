class MUtil {
  static int smartToInt(value) {
    if (value == null) {
      return 0;
    } else if (value is String) {
      return int.parse(value);
    } else if (value is double) {
      return value.toInt();
    } else if (value is int) {
      return value;
    } else {
      return 0;
    }
  }

  static String full2Num(int value) {
    final valueStr = value.toString();
    if (valueStr.length >= 2) {
      return valueStr;
    } else {
      return '0$valueStr';
    }
  }
}
