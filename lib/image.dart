import 'package:flutter/material.dart';

extension FlutterUIModifiersImage on Image {
  Image setSize(double size) {
    return _rebase(width: size, height: size);
  }

  Image setColor(Color? color) {
    return _rebase(color: color);
  }

  /// Internal modifier for modifying final properties.
  Image _rebase({
    double? width,
    double? height,
    Color? color,
    ImageProvider? image,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    String? semanticLabel,
    bool? excludeFromSemantics,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
    Rect? centerSlice,
    bool? matchTextDirection,
    bool? isAntiAlias,
    FilterQuality? filterQuality,
  }) {
    return Image(
      key: key,
      image: image ?? this.image,
      frameBuilder: frameBuilder ?? this.frameBuilder,
      loadingBuilder: loadingBuilder ?? this.loadingBuilder,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
      centerSlice: centerSlice ?? this.centerSlice,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      isAntiAlias: isAntiAlias ?? this.isAntiAlias,
      filterQuality: filterQuality ?? this.filterQuality,
    );
  }
}
