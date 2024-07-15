class MFormat {
  static String mill2DHMS(int milliseconds) {
    final millisecondsInSecond = 1000;
    final millisecondsInMinute = 60 * millisecondsInSecond;
    final millisecondsInHour = 60 * millisecondsInMinute;
    final millisecondsInDay = 24 * millisecondsInHour;

    final remainingMilliseconds = milliseconds % millisecondsInDay;
    final hours = remainingMilliseconds ~/ millisecondsInHour;
    final remainingMillisecondsInHour =
        remainingMilliseconds % millisecondsInHour;
    final minutes = remainingMillisecondsInHour ~/ millisecondsInMinute;
    final remainingMillisecondsInMinute =
        remainingMillisecondsInHour % millisecondsInMinute;
    final seconds = remainingMillisecondsInMinute ~/ millisecondsInSecond;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  /// secondToDurationString:
  /// second value to HH:mm:ss format, if less than 1 hour, will not show hour
  ///
  /// return String value like `02:11`.
  static String secondToDurationString(int? secondDuration) {
    if (secondDuration == null) {
      return "00:00";
    }
    final int hour = secondDuration ~/ 3600;
    final int minute = (secondDuration % 3600) ~/ 60;
    final int second = secondDuration % 60;
    if (hour > 0) {
      return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
    }
    return "${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
  }
}
