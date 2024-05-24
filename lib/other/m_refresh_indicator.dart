import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MRefreshIndicator extends RefreshIndicator {
  MRefreshIndicator(
      {super.key, required super.child, required RefreshCallback onRefresh})
      : super(
          onRefresh: () async {
            MConfig.isChildDataLoading.value = true;
            final value = await onRefresh();
            MConfig.isChildDataLoading.value = false;
            return value;
          },
        );
}
