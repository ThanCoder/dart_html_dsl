import 'package:dart_html_dsl/dart_html_dsl.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

enum BorderStyle {
  none('none'),
  solid('solid'),
  dashed('dashed'),
  dotted('dotted'),
  unset('double');

  final String css;
  const BorderStyle(this.css);
}

class Border with CssValueMixin {
  final List<String> parts;
  const Border(this.parts);

  factory Border.globalValue(CssGlobalValue value) {
    return Border([value.css]);
  }

  factory Border.style(BorderStyle style) {
    return Border([style.css]);
  }

  factory Border.all({
    CssUnit width = const Px(1),
    BorderStyle style = BorderStyle.solid,
    CssColor color = const NamedColor(name: CssNamedColor.black),
  }) {
    return Border([width.css, style.css, color.css]);
  }
  factory Border.styleColor({
    BorderStyle style = BorderStyle.solid,
    CssColor color = const NamedColor(name: CssNamedColor.black),
  }) {
    return Border([style.css, color.css]);
  }
  factory Border.withStyle({
    CssUnit width = const Px(1),
    BorderStyle style = BorderStyle.solid,
  }) {
    return Border([width.css, style.css]);
  }

  @override
  String get css => parts.join(' ');
}

extension BorderCssProperty on CssProperty {
  CssProperty border(Border value) => add('border', value.css);
}

/**
 * /* style */
border: solid;

/* width | style */
border: 2px dotted;

/* style | color */
border: outset #ff3333;

/* width | style | color */
border: medium dashed green;

/* Global values */
border: inherit;
border: initial;
border: revert;
border: revert-layer;
border: unset;
 */
