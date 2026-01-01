import 'package:dart_html_dsl/dart_html_dsl.dart';

enum Padding {
  inherit('inherit'),
  initial('initial'),
  revert('revert'),
  revertLayer('revert-layer'),
  unset('unset');

  final String css;
  const Padding(this.css);
}

class PaddingValue {
  final CssUnit top, right, bottom, left;

  const PaddingValue.all(CssUnit value)
    : top = value,
      right = value,
      bottom = value,
      left = value;

  // only (like EdgeInsets.fromLTRB)
  const PaddingValue.only({
    this.top = const Px(0),
    this.right = const Px(0),
    this.bottom = const Px(0),
    this.left = const Px(0),
  });

  // vertical (Flutter EdgeInsets.symmetric vertical)
  const PaddingValue.vertical(CssUnit value)
    : top = value,
      bottom = value,
      left = const Px(0),
      right = const Px(0);

  // horizontal (Flutter EdgeInsets.symmetric horizontal)
  const PaddingValue.horizontal(CssUnit value)
    : left = value,
      right = value,
      top = const Px(0),
      bottom = const Px(0);

  // symmetric (Flutter EdgeInsets.symmetric)
  const PaddingValue.symmetric({
    CssUnit vertical = const Px(0),
    CssUnit horizontal = const Px(0),
  }) : top = vertical,
       bottom = vertical,
       left = horizontal,
       right = horizontal;

  String get css => '${top.css} ${right.css} ${bottom.css} ${left.css}';
}

extension PaddingCssProperty on CssProperty {
  CssProperty padding(Padding value) => add('padding', value.css);
  CssProperty paddingValue(PaddingValue value) => add('padding', value.css);
}


/**
 * /* Apply to all four sides */
padding: 1em;

/* top and bottom | left and right */
padding: 5% 10%;

/* top | left and right | bottom */
padding: 1em 2em 2em;

/* top | right | bottom | left */
padding: 5px 1em 0 2em;

/* Global values */
padding: inherit;
padding: initial;
padding: revert;
padding: revert-layer;
padding: unset;
 */