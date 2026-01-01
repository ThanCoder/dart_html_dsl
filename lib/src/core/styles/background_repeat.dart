import 'package:dart_html_dsl/dart_html_dsl.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

enum BgRepeat {
  repeat('repeat'),
  repeatX('repeat-x'),
  repeatY('repeat-y'),
  space('space'),
  round('round'),
  noRepeat('no-repeat');

  final String css;
  const BgRepeat(this.css);
}

class BackgroundRepeat with CssValueMixin {
  final List<String> parts;
  const BackgroundRepeat(this.parts);

  @override
  String get css => parts.join(' ');

  factory BackgroundRepeat.globalValue(CssGlobalValue value) {
    return BackgroundRepeat([value.css]);
  }
  factory BackgroundRepeat.repeat(BgRepeat value) {
    return BackgroundRepeat([value.css]);
  }
  factory BackgroundRepeat.symmetric({
    required BgRepeat horizontal,
    required BgRepeat vertical,
  }) {
    return BackgroundRepeat([horizontal.css, vertical.css]);
  }
}
/**
 * /* Keyword values */
background-repeat: repeat;
background-repeat: repeat-x;
background-repeat: repeat-y;
background-repeat: space;
background-repeat: round;
background-repeat: no-repeat;

/* Two-value syntax: horizontal | vertical */
background-repeat: repeat space;
background-repeat: repeat repeat;
background-repeat: round space;
background-repeat: no-repeat round;

/* Global values */
background-repeat: inherit;
background-repeat: initial;
background-repeat: revert;
background-repeat: revert-layer;
background-repeat: unset;
 */