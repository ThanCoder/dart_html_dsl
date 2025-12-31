import 'package:dart_html_dsl/dart_html_dsl.dart';

class DomKey<T extends HtmlElement> {
  T? _element;

  void bind(T element) {
    _element = element;
  }

  T get current {
    if (_element == null) {
      throw Exception('DomKey not attached to any element');
    }
    return _element!;
  }

  String get selector => _element!.jsSelector;
}
