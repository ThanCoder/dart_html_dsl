import 'package:dart_html_dsl/dart_html_dsl.dart';

class ColumnWidget extends HtmlListElement {
  final JustifyContent justify;
  final AlignItems align;
  final FlexDirection flexDirection;
  final CssUnit gap;
  final Display display;
  ColumnWidget({
    required super.children,
    super.key,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    this.justify = JustifyContent.start,
    this.align = AlignItems.center,
    this.flexDirection = FlexDirection.column,
    this.display = Display.flex,
    this.gap = const Px(0),
  }) : super(
         style: CssProperty()
             .display(display)
             .justifyContent(justify)
             .alignItems(align)
             .flexDirection(flexDirection)
             .gap(gap)
             .addProperty(style),
       );
}
