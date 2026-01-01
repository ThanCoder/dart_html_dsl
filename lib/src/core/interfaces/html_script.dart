abstract class HtmlScript {
  final String tagName;
  final Map<String, dynamic> attributes;
  const HtmlScript({required this.tagName, required this.attributes});

  String get attrs {
    final buff = StringBuffer();
    attributes.forEach((key, value) {
      buff.write(' $key="$value"');
    });
    return buff.toString();
  }

  String renderHtml();
}

class HeaderScript extends HtmlScript {
  const HeaderScript({required super.tagName, required super.attributes});
  @override
  String renderHtml() {
    return '<$tagName$attrs>';
  }
}
