import 'package:dart_html_dsl/dart_html_dsl.dart';

class InputForm extends HtmlListElement {
  final FormMethod method;
  InputForm({
    required super.children,
    this.method = FormMethod.get,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
  });

  @override
  String renderHtml() {
    return '''
<form method="${method.name}" action="#" $attrStr>
    ${children.map((e) => e.renderHtml()).join('\n')}
</form>
  ''';
  }
}

enum FormMethod { dialog, post, get }
