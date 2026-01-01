import 'package:dart_html_dsl/dart_html_dsl.dart';

class RowWidget extends HtmlListElement {
  final JustifyContent justify; // start, center, end, space-between ...
  final AlignItems align; // start, center, end ...
  RowWidget({
    super.key,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    required super.children,
    this.justify = JustifyContent.start,
    this.align = AlignItems.start,
  }) : super(
         style: CssProperty()
           ..display(Display.flex)
           ..justifyContent(justify)
           ..alignItems(align).addProperty(style),
       );
}
