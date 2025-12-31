import 'package:dart_html_dsl/dart_html_dsl.dart';

class ListView extends HtmlElement {
  final HtmlWidget Function(JsItem item) itemBuilder;
  ListView({super.key, required this.itemBuilder});

  late final String _itemTemplate = _buildItemTemplate();

  String _buildItemTemplate() {
    final item = JsItem('item');
    final widget = itemBuilder(item);
    return widget.renderJs();
  }

  String get itemJsTemplate => _itemTemplate;

  @override
  String render() {
    return '<ul $attrStr></ul>';
  }
}
