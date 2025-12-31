import 'package:dart_html_dsl/dart_html_dsl.dart';

/// Base Widget interface
abstract class Widget {
  HtmlElement build();
}

/// StatelessWidget: immutable widget, no state
abstract class StatelessWidget extends Widget {
  @override
  HtmlElement build();
}

