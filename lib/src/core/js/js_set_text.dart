import 'package:dart_html_dsl/dart_html_dsl.dart';

class JsSetText extends JsCall {
  final DomKey targetKey;
  final String value;
  JsSetText({required this.targetKey, required this.value});

  @override
  String get expression {
    return '''
document.querySelector('${targetKey.selector}').textContent = "$value";
''';
  }
}
