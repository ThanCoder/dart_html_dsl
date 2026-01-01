import 'package:dart_html_dsl/src/core/interfaces/html_widget.dart';

class Text extends HtmlWidget {
  final String text;
  Text(this.text);
  @override
  String renderHtml() {
    return text;
  }
}
