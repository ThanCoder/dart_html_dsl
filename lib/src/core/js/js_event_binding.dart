import 'package:dart_html_dsl/src/core/js/js_event.dart';
import 'package:dart_html_dsl/src/core/widgets/html_widget.dart';

class JsEventBinding extends HtmlWidget {
  final String selector;
  final JsEvent event;

  JsEventBinding({required this.selector, required this.event});

  @override
  String render() {
    return '''
document.querySelector('$selector')?.addEventListener('${event.name}', function(e) {
    ${event.action.expression};
  });
''';
  }
}
