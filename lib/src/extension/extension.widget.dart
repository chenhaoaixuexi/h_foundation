// EasyShorcutsWidget 扩展 .shortcuts
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:h_foundation/src/extension/extension.obj.dart';

extension WidgetExt on Widget {
  Widget ignorePointer({bool ignoring = true}) {
    return IgnorePointer(
      ignoring: ignoring,
      child: this,
    );
  }

  Widget withRx<T>(RxObjectMixin<T> rx) {
    rx.value;
    return this;
  }

  Widget cover(Widget widget) {
    return widget;
  }

  Widget container({
    Color? color,
    Decoration? decoration,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      color: color,
      decoration: decoration,
      width: width,
      height: height,
      padding: padding,
      child: this,
    );
  }

  Widget expand({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  // Opacity
  Widget opacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  // safeArea
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  Widget boxConstraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: this,
    );
  }

  Widget constrained(BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: constraints,
      child: this,
    );
  }

  Widget limitBox({
    double? maxWidth,
    double? maxHeight,
  }) {
    return LimitedBox(
      maxWidth: maxWidth ?? double.infinity,
      maxHeight: maxHeight ?? double.infinity,
      child: this,
    );
  }

  Widget align({
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  //Column
  Widget Col({
    key,
    mainAxisAlignment,
    required MainAxisSize mainAxisSize,
    required CrossAxisAlignment crossAxisAlignment,
    TextDirection? textDirection,
    required VerticalDirection verticalDirection,
    TextBaseline? textBaseline,
    List<Widget>? children,
  }) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: [this].apply((it) {
        if (children != null) it.addAll(children);
      }),
    );
  }

// center
  Widget center() {
    return Center(child: this);
  }

  // Focus
  Widget focus({
    FocusNode? focusNode,
    FocusNode? parentNode,
    bool autofocus = false,
    ValueChanged<bool>? onFocusChange,
    FocusOnKeyEventCallback? onKeyEvent,
    FocusOnKeyCallback? onKey,
    bool? canRequestFocus,
    bool? skipTraversal,
    bool? descendantsAreFocusable,
    bool? descendantsAreTraversable,
    bool includeSemantics = true,
    String? debugLabel,
  }) {
    return Focus(
        focusNode: focusNode,
        parentNode: parentNode,
        autofocus: autofocus,
        onFocusChange: onFocusChange,
        onKeyEvent: onKeyEvent,
        onKey: onKey,
        canRequestFocus: canRequestFocus,
        skipTraversal: skipTraversal,
        descendantsAreFocusable: descendantsAreFocusable,
        descendantsAreTraversable: descendantsAreTraversable,
        includeSemantics: includeSemantics,
        debugLabel: debugLabel,
        child: this);
  }

  // FocusTraversalGroup
  Widget easyFocusTraversal({
    FocusTraversalPolicy? policy,
    bool descendantsAreFocusable = true,
    bool descendantsAreTraversable = true,
  }) {
    return FocusTraversalGroup(
      descendantsAreFocusable: descendantsAreFocusable,
      policy: policy,
      descendantsAreTraversable: descendantsAreTraversable,
      child: this,
    );
  }

  Widget easyTap({VoidCallback? onTap, VoidCallback? onDoubleTap, VoidCallback? onLongPress}) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: this,
    );
  }
}
