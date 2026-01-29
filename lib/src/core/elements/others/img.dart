// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_html_dsl/src/core/interfaces/html_element.dart';

class Img extends HtmlElement {
  final String src;
  final String alt;
  Img({
    super.key,
    super.id,
    super.attributes,
    super.className,
    super.readOnly,
    super.disabled,
    super.onEvent,
    super.style,
    required this.src,
    this.alt = 'img',
  });
  @override
  String renderHtml() {
    return '<img src="$src" alt="$alt" $attrStr />';
  }
}
