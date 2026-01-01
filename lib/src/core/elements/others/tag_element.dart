import 'package:dart_html_dsl/src/core/interfaces/html_element.dart';

class TagElement extends HtmlElement {
  final String tag;
  TagElement({
    super.key,
    super.id,
    super.customClass,
    super.attributes,
    super.style,
    super.onEvent,
    super.child,
    super.readOnly,
    super.disabled,
    required this.tag,
  });

  @override
  String renderHtml() {
    return '<$tag$attrStr>${child?.renderHtml()}</$tag>';
  }
}
