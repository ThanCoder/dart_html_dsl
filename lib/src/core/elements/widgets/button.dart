import 'package:dart_html_dsl/dart_html_dsl.dart';

class Button extends HtmlElement {
  final String text;

  Button({
    super.key,
    required this.text,
    super.onEvent,
    super.attributes,
    super.customClass,
    super.id,
    CssProperty? style,
    super.readOnly,
    super.disabled,
  }) : super(
         style: CssProperty()
             .backgroundColor(CssColors.namedColor(CssNamedColor.teal))
             .border(Border.all(width: 0.px))
             .borderRadius(BorderRadius.all(3.px))
             .color(CssColors.white)
             .padding(Padding.symmetric(vertical: 0.4.em, horizontal: 0.3.em))
             .hover(
               (s) =>
                   s.backgroundColor(CssColors.red).cursor(CssCursor.pointer),
             )
             .addProperty(style),
       );

  @override
  String render() {
    return '<button$attrStr>$text</button>';
  }
}
