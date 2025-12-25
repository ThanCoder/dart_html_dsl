import 'package:dart_html_dsl/src/core/elements/html_element.dart';
import 'package:dart_html_dsl/src/core/widgets/html_widget.dart';

class InputForm extends HtmlElement {
  final List<HtmlWidget> children;
  final FormMethod method;
  InputForm({
    this.method = FormMethod.get,
    required this.children,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
  }) : super(child: EmptyWidget());

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
