import 'package:dart_html_dsl/dart_html_dsl.dart';

class InputForm extends ListElement {
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
  String render() {
    return '''
<form method="${method.name}" action="#" $attrStr>
    ${children.map((e) => e.render()).join('\n')}
</form>
  ''';
  }
}

enum FormMethod { dialog, post, get }
