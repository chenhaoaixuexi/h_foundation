// EasyShorcutsWidget 扩展 .shortcuts
import 'package:flutter/material.dart' hide Hero, CreateRectTween, HeroPlaceholderBuilder, HeroFlightShuttleBuilder;
import 'package:get/get.dart';
import 'package:h_foundation/src/extension/extension.obj.dart';
import 'package:h_foundation/src/widget/fnheroes.dart';

extension IconDataExt on IconData {
  Icon asIcon({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
  }) {
    return Icon(
      this,
      grade: grade,
      opticalSize: opticalSize,
      size: size,
      fill: fill,
      shadows: shadows,
      weight: weight,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

extension WidgetExt on Widget {
  Widget ignorePointer({bool ignoring = true}) {
    return IgnorePointer(
      ignoring: ignoring,
      child: this,
    );
  }

  // Transform.rotate
  Widget rotate(double angle, {Offset origin = Offset.zero, AlignmentGeometry alignment = Alignment.center}) {
    return Transform.rotate(
      angle: angle,
      origin: origin,
      alignment: alignment,
      child: this,
    );
  }

  //tooltip
  Widget tooltip(String message, {Key? key}) {
    return Tooltip(
      message: message,
      key: key,
      child: this,
    );
  }

  Widget position({
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      width: width,
      height: height,
      child: this,
    );
  }

  // FittedBox
  Widget fittedBox({
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  Widget hero(
    Object tag, {
    Key? key,
    CreateRectTween? createRectTween,
    HeroFlightShuttleBuilder? flightShuttleBuilder,
    HeroPlaceholderBuilder? placeholderBuilder,
    bool transitionOnUserGestures = false,
  }) {
    return Hero(
      key: key,
      tag: tag,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: this,
    );
  }

// asScaffoldBody
  Widget asScaffoldBody({bool? resizeToAvoidBottomInset}) {
    return Scaffold(
      body: this,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  // opacity
  Widget opacity(double opacity) {
    return Opacity(
      opacity: opacity,
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

  Widget constrained(BoxConstraints? constraints) {
    if (constraints == null) return this;
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

  // LayoutBuilder
  Widget layoutBuilder(Function(BoxConstraints) onConstraints) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        onConstraints.call(constraints);
        return this;
      },
    );
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
