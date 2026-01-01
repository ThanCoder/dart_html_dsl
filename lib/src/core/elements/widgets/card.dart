import 'package:dart_html_dsl/dart_html_dsl.dart';

class Card extends TagElement {
  Card({
    super.key,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    required super.child,
  }) : super(
         tag: 'div',
         style: CssProperty()
             .backgroundColor(CssColors.hexColor(0x3c3c3c))
             .borderRadius(BorderRadius.all(4.px))
             .padding(Padding.all(0.4.em))
             .display(Display.block)
             .addProperty(style),
       );
}
