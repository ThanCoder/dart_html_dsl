import 'package:dart_html_dsl/dart_html_dsl.dart';

class GridWidget extends HtmlListElement {
  final GridTemplateColumns columns;
  final CssUnit gap;
  final JustifyContent justify;
  final AlignItems align;
  GridWidget({
    required super.children,
    super.key,
    super.attributes,
    super.className,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    this.gap = const Px(0),
    this.justify = JustifyContent.start,
    this.align = AlignItems.start,
    required this.columns,
  }) : super(
         style: CssProperty()
             .display(Display.grid)
             .gridTemplateColumns(columns)
             .gap(gap)
             .alignItems(align)
             .justifyContent(justify)
             .addProperty(style),
       );
}
