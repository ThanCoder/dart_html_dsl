import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlEvent {
  ///
  /// click, input, change...
  ///
  final JsEventName name;
  final JsCall action;

  HtmlEvent({required this.name, required this.action});
}
