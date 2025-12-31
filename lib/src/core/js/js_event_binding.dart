import 'package:dart_html_dsl/dart_html_dsl.dart';

class JsEventBinding extends JsScriptCode {
  final String selector;
  final JsEvent event;

  JsEventBinding({required this.selector, required this.event});

  @override
  String jsSource({HtmlElement? ele}) {
    // if (ele != null) {
    //   print(ele.jsSelector);
    //   print('ev: $selector');
    // }
    return '''
document.querySelector('$selector').addEventListener('${event.eventName.name}', (e)=> {
    ${normalizeJs(event.action.expression)};
  });
''';
  }

  String normalizeJs(String code) =>
      code.trim().endsWith(';') ? code : '$code;';
}
