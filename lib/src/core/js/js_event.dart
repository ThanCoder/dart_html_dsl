import 'package:dart_html_dsl/src/core/js/js_call.dart';

class JsEvent {
  ///
  /// click, input, change...
  ///
  final String name;
  final JsCall action;

  JsEvent({required this.name, required this.action});
}
