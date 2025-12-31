import 'package:dart_html_dsl/dart_html_dsl.dart';

class HomePage extends HtmlPage {
  HomePage({required super.pageProps});

  @override
  HtmlWidget build() {
    return ColumnWidget(
      children: [
        H1(style: CssProperty().color(CssColors.red), child: Text('h1 test')),

        Button(
          text: 'hello',
          onEvent: [
            JsEvent(eventName: JsEventName.click, action: JsCallAlert('alert')),
          ],
        ),
        Counter2(),
      ],
    );
  }
}

class Counter2 extends JsStateful {
  @override
  Map<String, dynamic> get initialState => {'count': 0, 'age': 28};

  @override
  HtmlWidget build() {
    return ColumnWidget(
      gap: 0.4.em,
      children: [
        H2(child: Text(getState('count'))),
        H1(child: Text(getState('age'))),
        Button(
          text: 'Incre',
          onEvent: [
            JsEvent(
              eventName: JsEventName.click,
              action: JsCallState('count', 'count + 1'),
            ),
          ],
        ),
        Button(
          text: 'deCre',
          onEvent: [
            JsEvent(
              eventName: JsEventName.click,
              action: JsCallState('count', 'count - 1'),
            ),
          ],
        ),
      ],
    );
  }
}
