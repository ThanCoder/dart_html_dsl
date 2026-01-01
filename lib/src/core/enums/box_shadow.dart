import 'package:dart_html_dsl/dart_html_dsl.dart';

enum BoxShadow {
  none('none'),
  inherit('inherit'),
  initial('initial'),
  revert('revert'),
  revertLayer('revert-layer'),
  unset('unset');

  final String css;
  const BoxShadow(this.css);
}

extension BoxShadowCssProperty on CssProperty {
  CssProperty boxShadow(BoxShadow value) => add('box-shadow', value.css);
  CssProperty boxShadowTwoL(CssColor color, CssUnit length1, CssUnit length2) =>
      add('box-shadow', '${color.css} ${length1.css} ${length2.css}');
  CssProperty boxShadowThreeLC(
    CssUnit length1,
    CssUnit length2,
    CssUnit length3,
    CssColor color,
  ) => add(
    'box-shadow',
    '${length1.css} ${length2.css} ${length3.css} ${color.css}',
  );
  CssProperty boxShadowFourLC(
    CssUnit length1,
    CssUnit length2,
    CssUnit length3,
    CssUnit length4,
    CssColor color,
  ) => add(
    'box-shadow',
    '${length1.css} ${length2.css} ${length3.css} ${length4.css} ${color.css}',
  );
}

/**
 * /* Keyword values */
box-shadow: none;

/* A color and two length values */
/* <color> | <length> | <length> */
box-shadow: red 60px -16px;

/* Three length values and a color */
/* <length> | <length> | <length> | <color> */
box-shadow: 10px 5px 5px black;

/* Four length values and a color */
/* <length> | <length> | <length> | <length> | <color> */
box-shadow: 2px 2px 2px 1px rgb(0 0 0 / 20%);

/* inset, length values, and a color */
/* <inset> | <length> | <length> | <color> */
box-shadow: inset 5em 1em gold;

/* Any number of shadows, separated by commas */
box-shadow:
  3px 3px red inset,
  -1em 0 0.4em olive;

/* Global values */
box-shadow: inherit;
box-shadow: initial;
box-shadow: revert;
box-shadow: revert-layer;
box-shadow: unset;

 */
