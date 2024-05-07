import 'package:flutter/cupertino.dart';

extension SpaceNum on num {
  SizedBox get space {
    return SizedBox(height: this.toDouble(), width: this.toDouble());
  }

  SizedBox get spaceH {
    return SizedBox(height: this.toDouble());
  }

  SizedBox get spaceW {
    return SizedBox(width: this.toDouble());
  }

  SizedBox get spaceHeight {
    return SizedBox(height: this.toDouble());
  }

  SizedBox get spaceWidth {
    return SizedBox(width: this.toDouble());
  }
}
