import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlListElement extends HtmlElement {
  final List<HtmlWidget> children;
  HtmlListElement({
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

  String get cssAllScript {
    final out = <String>{};
    for (var widget in children) {
      out.add(widget.cssScript);
    }
    return out.join('\n');
  }

  String get jsAllScript {
    final codes = <String>{};
    for (var widget in children) {
      codes.add(widget.jsScript);
    }
    return codes.join('\n');
  }

  @override
  String renderHtml() {
    final res = children.map((e) => e.renderHtml()).join('\n');
    return '<div$attrStr>$res</div>';
  }
}
