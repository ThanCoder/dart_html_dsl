import 'package:dart_html_dsl/dart_html_dsl.dart';

class JsLog extends JsCall {
  final String text;
  JsLog(this.text);

  factory JsLog.log(String text) => JsLog('console.log(\'$text\')');
  factory JsLog.assertLog(String text) => JsLog('console.assert(\'$text\')');
  factory JsLog.debug(String text) => JsLog('console.debug(\'$text\')');
  factory JsLog.error(String text) => JsLog('console.error(\'$text\')');
  factory JsLog.warn(String text) => JsLog('console.warn(\'$text\')');
  factory JsLog.info(String text) => JsLog('console.info(\'$text\')');

  @override
  String get expression =>
      text.startsWith('console') ? text : 'console.log(\'$text\')';
}
