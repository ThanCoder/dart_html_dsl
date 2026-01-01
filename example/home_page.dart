import 'package:dart_html_dsl/dart_html_dsl.dart';

class HomePage extends HtmlPage {
  HomePage({required super.pageProps});

  @override
  HtmlWidget build() {
    return ColumnWidget(
      style: CssProperty()
          .backgroundColor(CssColors.pink)
          .boxShadowTwoL(CssColors.green, 4.px, 4.px)
          .borderRadius(BorderRadius.all(9.px)),
      children: [
        H1(style: CssProperty().color(CssColors.red), child: Text('h1 test')),

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
