import 'package:dart_html_dsl/src/core/styles/css_property.dart';

enum AlignItems {
  start('flex-start'),
  center('center'),
  end('flex-end'),
  stretch('stretch');

  final String css;
  const AlignItems(this.css);
}

extension AlignItemsCssProperty on CssProperty {
  CssProperty alignItems(AlignItems value) => add('align-items', value.css);
}
