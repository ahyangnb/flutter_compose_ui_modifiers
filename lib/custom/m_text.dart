import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MTextController extends TextEditingController {
  final String? name;
  final int maxInput;
  final bool mustInput;

  FocusNode focusNode = FocusNode();

  MTextController(
      {this.name,
      required this.maxInput,
      this.mustInput = true,
      String? defText}) {
    if (GetUtils.isNullOrBlank(defText)?.not() ?? false) {
      text = defText!;
    }
    this.addListener(() {
      if (this.text.length > maxInput) {
        this.text = this.text.substring(0, maxInput);
        this.selection =
            TextSelection.fromPosition(TextPosition(offset: this.text.length));
        mShowCustomToast('Please enter less than $maxInput characters');
      }
    });
  }

  bool check() {
    if (mustInput.not()) {
      return true;
    }
    if (this.text.isEmpty) {
      mShowCustomToast('Please enter${" $name" ?? ''}');
      focusNode.requestFocus();
      return false;
    }
    return true;
  }
}
