import 'package:dart_html_dsl/dart_html_dsl.dart';

class Select extends HtmlElement {
  final List<Option> options;
  Select({
    super.key,
    CssProperty? style,
    super.id,
    super.attributes,
    super.customClass,
    this.options = const [],
  }) : super(
         child: null,
         style: CssProperty()
             .cssWith(200.px)
             .paddingValue(PaddingValue.all(8.px))
             .border(Border.all(width: 1.px, color: CssColors.gray))
             .borderRadius(BorderRadius.all(4.px))
             .backgroundColor(CssColors.white)
             .hover((s) => s.backgroundColor(CssColors.pink.shade600))
             .addProperty(style),
       );

  @override
  String renderHtml() {
    final buffer = StringBuffer();
    buffer.write('<select$attrStr>');
    for (var o in options) {
      buffer.write(o.renderHtml());
    }
    buffer.write('</select>');
    return buffer.toString();
  }
}

class Option extends HtmlElement {
  final String value;
  final String text;
  Option({required this.value, required this.text}) : super(child: null);

  @override
  String renderHtml() => '<option value="$value">$text</option>';
}
