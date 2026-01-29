import 'package:dart_html_dsl/dart_html_dsl.dart';

class HomePage extends HtmlPage {
  HomePage({required super.pageProps});

  @override
  HtmlWidget build() {
    return ColumnWidget(
      style: CssProperty()
          .backgroundColor(CssColors.pink)
          .borderRadius(BorderRadius.only())
          .border(Border.style(BorderStyle.dashed)),
      children: [
        H1(style: CssProperty().color(CssColors.red), child: Text('h1 test')),
      Link(href: '',child: Text('hello')),
        Button(
          text: 'hello',
          onEvent: [
            JsEvent(eventName: JsEventName.click, action: JsCallAlert('alert')),
          ],
        ),
      ],
    );
  }
}
