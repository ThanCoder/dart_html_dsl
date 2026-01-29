import 'package:dart_html_dsl/src/core/interfaces/html_element.dart';

class Link extends HtmlElement {
  final String href;
  final LinkTarget? target;
  Link({
    super.key,
    super.id,
    super.className,
    Map<String, String>? attributes,
    super.style,
    super.onEvent,
    super.readOnly,
    super.disabled,
    this.target,
    required this.href,
    required super.child,
  }) : super(
         attributes: {
           if (attributes != null) ...attributes,
           if (target != null) ...{'target': target.value},
         },
       );
  @override
  String renderHtml() {
    return '<a href="$href" $attrStr>${child!.renderHtml()}</a>';
  }
}

enum LinkTarget {
  blank("_blank"),
  self("_self"),
  parent("_parent"),
  top("_top");

  final String value;
  const LinkTarget(this.value);
}
