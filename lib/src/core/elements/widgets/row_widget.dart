import 'package:dart_html_dsl/dart_html_dsl.dart';

class RowWidget extends ListElement {
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

  @override
  String render() {
    final childrenHtml = children.map((c) => c.render()).join('\n');
    return '<div $attrStr>$childrenHtml</div>';
  }

  //return '<div style="display:flex; justify-content:$justify; align-items:$align;">$childrenHtml</div>';
}
