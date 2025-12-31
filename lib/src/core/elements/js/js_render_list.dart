import 'package:dart_html_dsl/dart_html_dsl.dart';

class JsRenderList extends JsCall {
  final ListView listView;
  JsRenderList({required this.listView});

  @override
  String get expression =>
      '''
  const container = document.querySelector('${listView.jsSelector}');
if (!container) return;

container.innerHTML = "";

value.forEach((item, index) => {
  const tpl = `${listView.itemJsTemplate}`;
  container.insertAdjacentHTML("beforeend", tpl);
});
''';
}
