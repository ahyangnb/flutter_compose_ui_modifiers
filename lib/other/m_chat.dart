import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Some content form `chat_bubbles` plugin in pub.dev.
Gradient? _mChatGetGradient(Color? color, bool isSender, Gradient? gradient) {
  if (gradient == null) {
    if (color != null) {
      return null;
    } else if (isSender) {
      return MThemeConfig.gradientMain;
    }
    return LinearGradient(colors: [
      Color(0xff323233),
      Color(0xff323233),
    ]);
  } else {
    return gradient;
  }
}

class PanelListItem {
  final String icon;
  final String label;

  PanelListItem(this.icon, this.label);
}

class MChatPanel extends StatelessWidget {
  const MChatPanel(
    this.controller,
    this.call, {
    required this.list,
    this.sendIcon,
    this.emojiIcon,
    this.moreIcon,
    super.key,
  });

  final MTextController controller;
  final CallChatPanel call;
  final List<PanelListItem> list;
  final String? sendIcon;
  final String? emojiIcon;
  final String? moreIcon;

  @override
  Widget build(BuildContext context) {
    return MColumn(
      modifier: MColumnModifier.borderTop(color: Colors.white.withOpacity(0.5))
          .backgroundColor(Colors.white.withOpacity(0.1))
          .paddingVertical(12.px),
      children: [
        MRow(
          children: [
            16.pxW,
            MTextField(
              modifier: MTextFieldModifier.backgroundColor(
                      Colors.white.withOpacity(0.6))
                  .borderAll()
                  .minHeight(36.px)
                  .maxHeight(300.px)
                  .borderRadius(18.px)
                  .color(Colors.black)
                  .center()
                  .flex()
                  .contentPaddingHorizontal(0)
                  .contentPaddingVertical(10.px)
                  .expands(false)
                  .leading(
                    (GetUtils.isNullOrBlank(emojiIcon) ?? true)
                        ? Container()
                        : MImage(
                            modifier: MImageModifier.sizeAll(34.px)
                                .marginHorizontal(5.px)
                                .marginVertical(1.px)
                                .click(() {
                              myToast('emoji');
                            }),
                            data: emojiIcon,
                          ),
                  )
                  .trailing(
                    (GetUtils.isNullOrBlank(sendIcon) ?? true)
                        ? Icon(Icons.send)
                        : MImage(
                            modifier: MImageModifier.sizeAll(34.px)
                                .marginHorizontal(8.px)
                                .marginVertical(1.px)
                                .click(() {
                              // logic.send();
                              controller.clear();
                            }),
                            data: sendIcon,
                          ),
                  ),
              controller: controller,
            ),
            if (GetUtils.isNullOrBlank(moreIcon) ?? true)
              Container()
            else
              MImage(
                data: moreIcon,
                modifier: MImageModifier.sizeAll(34.px).marginHorizontal(11.px),
              ),
          ],
        ),
        MRow(
          modifier: MRowModifier.safeArea(top: false).paddingHorizontal(4.px),
          children: list.map((e) => MPanelItem(e, call)).toList(),
        )
      ],
    );
  }
}

typedef CallChatPanel = void Function(String icon);

class MPanelItem extends StatelessWidget {
  MPanelItem(this.item, this.call);

  final PanelListItem item;
  final CallChatPanel call;

  @override
  Widget build(BuildContext context) {
    return MColumn(
      modifier:
          MColumnModifier.paddingTop(16.px).marginHorizontal(20.px).click(() {
        call(item.icon);
      }),
      children: [
        MImage(
          modifier: MImageModifier.sizeAll(48.px),
          data: item.icon,
        ),
        2.pxH,
        MText(
          modifier: MTextModifier.fontSize(12.px)
              .color(Colors.white.withOpacity(0.6)),
          data: item.label,
        ),
        8.pxH,
      ],
    );
  }
}

class MChatImageBubble extends StatelessWidget {
  static const loadingWidget = Center(
    child: CircularProgressIndicator(),
  );

  final String id;
  final Widget image;
  final double? bubbleRadius;
  final Color? color;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final bool isSender;

  const MChatImageBubble({
    Key? key,
    required this.id,
    required this.image,
    this.bubbleRadius,
    this.gradient,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    this.leading,
    this.trailing,
    this.isSender = true,
    this.color,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  /// image bubble builder method
  @override
  Widget build(BuildContext context) {
    final bubbleRadiusValue = bubbleRadius ?? 16.px;
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Row(
      children: <Widget>[
        isSender
            ? const Expanded(
                child: SizedBox(
                  width: 5,
                ),
              )
            : leading ?? Container(),
        Container(
          padding: padding,
          margin: margin,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .5,
            maxHeight: MediaQuery.of(context).size.width * .5,
          ),
          child: GestureDetector(
              child: Hero(
                tag: id,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        gradient: _mChatGetGradient(color, isSender, gradient),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(bubbleRadiusValue),
                          topRight: Radius.circular(bubbleRadiusValue),
                          bottomLeft: Radius.circular(tail
                              ? isSender
                                  ? bubbleRadiusValue
                                  : 0
                              : bubbleRadiusValue),
                          bottomRight: Radius.circular(tail
                              ? isSender
                                  ? 0
                                  : bubbleRadiusValue
                              : bubbleRadiusValue),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(bubbleRadiusValue),
                          child: image,
                        ),
                      ),
                    ),
                    stateIcon != null && stateTick
                        ? Positioned(
                            bottom: 4,
                            right: 6,
                            child: stateIcon,
                          )
                        : SizedBox(
                            width: 1,
                          ),
                  ],
                ),
              ),
              onLongPress: onLongPress,
              onTap: onTap ??
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return _DetailImageScreen(
                        tag: id,
                        image: image,
                      );
                    }));
                  }),
        ),
        if (isSender && trailing != null) SizedBox.shrink(),
      ],
    );
  }
}

class _DetailImageScreen extends StatefulWidget {
  final String tag;
  final Widget image;

  const _DetailImageScreen({Key? key, required this.tag, required this.image})
      : super(key: key);

  @override
  _DetailImageScreenState createState() => _DetailImageScreenState();
}

class _DetailImageScreenState extends State<_DetailImageScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(
            tag: widget.tag,
            child: widget.image,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class MChatTextBubble extends StatelessWidget {
  final double? bubbleRadius;
  final bool isSender;
  final Color? color;
  final String text;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle? textStyle;
  final BoxConstraints? constraints;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final Gradient? gradient;

  MChatTextBubble({
    Key? key,
    required this.text,
    this.constraints,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    this.bubbleRadius,
    this.isSender = true,
    this.color,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.textStyle,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bubbleRadiusValue = bubbleRadius ?? 16.px;
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Row(
      children: <Widget>[
        isSender ? Expanded(child: SizedBox(width: 5)) : leading ?? Container(),
        Container(
          color: Colors.transparent,
          constraints: constraints ??
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
          margin: margin,
          padding: padding,
          child: GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                gradient: _mChatGetGradient(color, isSender, gradient),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(bubbleRadiusValue),
                  topRight: Radius.circular(bubbleRadiusValue),
                  bottomLeft: Radius.circular(tail
                      ? isSender
                          ? bubbleRadiusValue
                          : 0
                      : bubbleRadiusValue),
                  bottomRight: Radius.circular(tail
                      ? isSender
                          ? 0
                          : bubbleRadiusValue
                      : bubbleRadiusValue),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: stateTick
                        ? EdgeInsets.fromLTRB(12, 6, 28, 6)
                        : EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: SelectableText(
                      text,
                      style: () {
                        if (textStyle != null) {
                          return textStyle;
                        } else if (isSender) {
                          return const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          );
                        } else {
                          return const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          );
                        }
                      }(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  stateIcon != null && stateTick
                      ? Positioned(bottom: 4, right: 6, child: stateIcon)
                      : SizedBox(width: 1),
                ],
              ),
            ),
          ),
        ),
        if (isSender && trailing != null) SizedBox.shrink(),
      ],
    );
  }
}

class MChatDateChip extends StatelessWidget {
  final DateTime date;
  final Color color;

  const MChatDateChip({
    Key? key,
    required this.date,
    this.color = const Color(0x558AD3D5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 7,
          bottom: 7,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              Algo.dateChipText(date),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class Algo {
  Algo._();

  static String dateChipText(final DateTime date) {
    final dateChipText = new DateChipText(date);
    return dateChipText.getText();
  }
}

///initial formatter to find the date txt
final DateFormat _formatter = DateFormat('yyyy-MM-dd');

///[DateChipText] class included with algorithms which are need to implement [DateChip]
///[date] parameter is required
///
class DateChipText {
  final DateTime date;

  DateChipText(this.date);

  ///generate and return [DateChip] string
  ///
  ///
  String getText() {
    final now = new DateTime.now();
    if (_formatter.format(now) == _formatter.format(date)) {
      return 'Today';
    } else if (_formatter
            .format(new DateTime(now.year, now.month, now.day - 1)) ==
        _formatter.format(date)) {
      return 'Yesterday';
    } else {
      return '${DateFormat('d').format(date)} ${DateFormat('MMMM').format(date)} ${DateFormat('y').format(date)}';
    }
  }
}
