import 'package:flutter/cupertino.dart';

extension SpaceNum on num {
  SizedBox get space {
    return SizedBox(height: this.toDouble(), width: this.toDouble());
  }
}
