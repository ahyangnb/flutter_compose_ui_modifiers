import 'package:intl/intl.dart';

/// example:
/// ```
/// void exampleUsage() {
//   DateTime startTime = DateTime.parse("2024-06-20T16:00:00");
//   DateTime endTime = DateTime.parse("2024-06-20T20:00:00");
//
//   String formattedTimeRange = mFormatTimeRange(startTime, endTime);
//   print(formattedTimeRange); // Output: 06.20.2024 4:00 PM - 8:00 PM
// }
/// ```
String mFormatTimeRange(DateTime startTime, DateTime endTime) {
  final DateFormat dateFormatter = DateFormat('MM.dd.yyyy');
  final DateFormat timeFormatter = DateFormat('h:mm a');

  String startDate = dateFormatter.format(startTime);
  String startTimeFormatted = timeFormatter.format(startTime);
  String endTimeFormatted = timeFormatter.format(endTime);

  if (startTime.year == endTime.year &&
      startTime.month == endTime.month &&
      startTime.day == endTime.day) {
    return '$startDate $startTimeFormatted - $endTimeFormatted';
  } else {
    return '$startDate $startTimeFormatted';
  }
}