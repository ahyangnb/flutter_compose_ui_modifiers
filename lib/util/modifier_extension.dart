import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

extension ModifierExtension on String {
  MText textModifier(DefineMTextModifier modifier) {
    return MText(modifier: modifier, data: this);
  }

  MText mText(DefineMTextModifier modifier) {
    return MText(modifier: modifier, data: this);
  }

  MText text(DefineMTextModifier modifier) {
    return MText(modifier: modifier, data: this);
  }
}
