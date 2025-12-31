import 'package:dart_html_dsl/dart_html_dsl.dart';

class ColumnWidget extends ListElement {
  final JustifyContent justify;
  final AlignItems align;
  final FlexDirection flexDirection;
  final CssUnit gap;
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
    this.align = AlignItems.start,
    this.flexDirection = FlexDirection.column,
    this.gap = const Px(0),
  }) : super(
         style: CssProperty()
             .display(Display.flex)
             .justifyContent(justify)
             .alignItems(align)
             .flexDirection(flexDirection)
             .gap(gap)
             .addProperty(style),
       );

  @override
  String render() {
    final childrenHtml = children.map((c) => c.render()).join('\n');
    return '<div$attrStr>$childrenHtml</div>';
  }
}

// return '<div style="display:flex; flex-direction:column; justify-content:$justify; align-items:$align;">$childrenHtml</div>';
