# Todo list.
### 1. Create a extension who can convert a widget to a Modifier of widgets.

lear:
https://pub-web.flutter-io.cn/packages/widget_modifier

### 2. Add refresh component to the widget_modifier.

### 3. Add lot of widget with different style.

such as Mini button, Large button, Small button, etc. 

```dart
MButton(
  modifier: MButtonModifier.mini().text("Mini Button"),
);
```

### 4. Auto wrap width in row
Auto get the remaining size and wrap maxWidth the widget, if content not so much 
wii not occupy whole remaining width.


### 5. replace AddButton to a property of General.
 
### 5. use mix to cancel `[` and `]` in some List widget.

### 6. MImage add new method to show add button.
if show add button and click will call: 
```dart 
await MUtilPickerImage.changeAvatar();
```

### 7. support GetBuilder and condition before return.

### 8. support hero.

### 9. fix column set scroll controller not work. [done]
because i have use MRefresh, and we need pass the scroll controller to MRefresh. 
```
        // modifier: MColumnModifier.crossAxisAlignment(CrossAxisAlignment.start)
        //     .scrollable(true)
        //     .scrollController(controller),
```

### 10. Research why MRefresh can not with ListView.
