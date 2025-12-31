import 'package:dart_html_dsl/src/core/interfaces/html_element.dart';
import 'package:dart_html_dsl/src/core/interfaces/html_widget.dart';

class ListElement extends HtmlElement {
  final List<HtmlWidget> children;
  ListElement({
    super.attributes,
    super.customClass,
    super.disabled,
    super.id,
    super.key,
    super.onEvent,
    super.readOnly,
    super.style,
    required this.children,
  });

  @override
  String render() {
    final res = children.map((e) => e.render()).join('\n');
    return '<div $attrStr>$res<div>';
  }
}
