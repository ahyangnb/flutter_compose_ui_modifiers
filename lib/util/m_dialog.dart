import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeStartToEndModel {
  // millisecondsSinceEpoch
  final int startTime;

  // millisecondsSinceEpoch
  final int endTime;

  //
  final String timeStr;

  TimeStartToEndModel({
    required this.startTime,
    required this.endTime,
    required this.timeStr,
  });
}

Future<TimeStartToEndModel?> selectDateTimePicker() async {
  final DateTime? pickedDate = await showDatePicker(
    context: Get.context!,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedStartTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      helpText: "Select start time.",
    );

    if (pickedStartTime == null) {
      return null;
    }
    TimeOfDay? pickedEndTime;
    do {
      pickedEndTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
        helpText: "Select end time.",
      );

      if (pickedEndTime != null &&
          (pickedEndTime.hour < pickedStartTime.hour ||
              (pickedEndTime.hour == pickedStartTime.hour &&
                  pickedEndTime.minute < pickedStartTime.minute))) {
        // Show a message to the user
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text('End time cannot be earlier than start time'),
          ),
        );
        pickedEndTime = null;
      }
    } while (pickedEndTime == null);

    final dateFormat = DateFormat('yyyy/MM/dd HH:mm');
    final timeFormat = DateFormat('HH:mm');

    final newStartTime = DateTime(pickedDate.year, pickedDate.month,
        pickedDate.day, pickedStartTime.hour, pickedStartTime.minute);
    final startTimeStrFormat = dateFormat.format(newStartTime);

    final endNewTime = DateTime(pickedDate.year, pickedDate.month,
        pickedDate.day, pickedEndTime.hour, pickedEndTime.minute);
    final endTimeStrFormat = timeFormat.format(endNewTime);

    return TimeStartToEndModel(
        timeStr: '$startTimeStrFormat-$endTimeStrFormat',
        startTime: newStartTime.millisecondsSinceEpoch,
        endTime: endNewTime.millisecondsSinceEpoch);
  }
  return null;
}
