// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class JsCall {
  const JsCall();
  String get expression;
}

class JsCallAlert extends JsCall {
  final String text;
  const JsCallAlert(this.text);

  @override
  String get expression => 'window.alert(\'$text\')';
}

class JsCallRaw extends JsCall {
  final String jsCode;
  JsCallRaw({required this.jsCode});

  @override
  String get expression => jsCode;
}
