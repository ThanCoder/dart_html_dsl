import 'package:dart_html_dsl/dart_html_dsl.dart';

enum BoxSizing {
  borderBox('border-box'),
  contentBox('content-box'),
  inherit('inherit'),
  revert('revert'),
  revertLayer('revert-layer'),
  unset('unset');

  final String css;
  const BoxSizing(this.css);
}

extension BoxSizingCssProperty on CssProperty {
  CssProperty boxSizing(BoxSizing value) => add('box-sizing', value.css);
}

/**box-sizing: border-box;
box-sizing: content-box;

/* Global values */
box-sizing: inherit;
box-sizing: initial;
box-sizing: revert;
box-sizing: revert-layer;
box-sizing: unset; */
