import 'package:dart_html_dsl/dart_html_dsl.dart';

class JsFetch extends JsCall {
  final String url;
  final JsMethod method;
  final HtmlElement target;
  final JsFetchReturnType fetchReturnType;
  final JsCall? onError;
  final JsCall? onSuccess;
  const JsFetch({
    required this.url,
    this.method = JsMethod.get,
    required this.target,
    this.fetchReturnType = JsFetchReturnType.json,
    this.onError,
    this.onSuccess,
  });

  @override
  String get expression =>
      ''' fetch("$url")
        .then((response) => response.${fetchReturnType.expression})
        .then((value) => {
        ${onSuccess?.expression ?? ''}
        })
        .catch((err) => {
        ${onError?.expression ?? ''}
        });''';
}

enum JsFetchReturnType {
  arrayBuffer('arrayBuffer()'),
  blob('blob()'),
  bytes('bytes()'),
  formData('formData()'),
  json('json()'),
  text('text()');

  final String expression;
  const JsFetchReturnType(this.expression);
}

enum JsMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String value;
  const JsMethod(this.value);
}
