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
}
