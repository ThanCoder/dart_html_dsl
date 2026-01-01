import 'package:dart_html_dsl/src/core/styles/css_property.dart';

enum Display {
  block('block'),
  inline('inline'),
  flex('flex'),
  inlineFlex('inline-flex'),
  grid('grid'),
  none('none');

  final String css;
  const Display(this.css);
}

extension DisplayCssProperty on CssProperty {
  CssProperty display(Display value) => add('display', value.css);
}
