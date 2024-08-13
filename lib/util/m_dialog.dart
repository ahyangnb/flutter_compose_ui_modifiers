import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'm_date.dart';

class TimeStartToEndModel {
  // millisecondsSinceEpoch
  final int startTime;

  // millisecondsSinceEpoch
  final int endTime;

  String get timeStr {
    return mFormatTimeRange(DateTime.fromMillisecondsSinceEpoch(startTime),
        DateTime.fromMillisecondsSinceEpoch(endTime));
  }

  TimeStartToEndModel({
    required this.startTime,
    required this.endTime,
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

    final newStartTime = DateTime(pickedDate.year, pickedDate.month,
        pickedDate.day, pickedStartTime.hour, pickedStartTime.minute);

    final endNewTime = DateTime(pickedDate.year, pickedDate.month,
        pickedDate.day, pickedEndTime.hour, pickedEndTime.minute);

    return TimeStartToEndModel(
        startTime: newStartTime.millisecondsSinceEpoch,
        endTime: endNewTime.millisecondsSinceEpoch);
  }
  return null;
}
