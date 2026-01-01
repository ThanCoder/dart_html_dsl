import 'package:dart_html_dsl/dart_html_dsl.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

enum BoxShadowType { normal, inset }

class BoxShadow with CssValueMixin {
  final List<String> parts;
  const BoxShadow(this.parts);

  @override
  String get css => parts.join(' ');

  factory BoxShadow.globalValue(CssGlobalValue value) {
    return BoxShadow([value.css]);
  }

  /// ### box-shadow: none;
  factory BoxShadow.none() {
    return BoxShadow(['none']);
  }

  /// ### A color and two length values
  ///  `<color> | <length> | <length>`
  /// 
  /// ### box-shadow: red 60px -16px;
  factory BoxShadow.twoLengthColor({
    required CssColor color,
    required CssUnit length1,
    required CssUnit length2,
  }) {
    return BoxShadow([color.css, length1.css, length2.css]);
  }
  /// ### Three length values and a color 
  /// 
  /// `<length> | <length> | <length> | <color>` 
  factory BoxShadow.threeLengthColor({
    required CssUnit length1,
    required CssUnit length2,
    required CssUnit length3,
    required CssColor color,
  }) {
    return BoxShadow([length1.css, length2.css, length3.css, color.css]);
  }
  /// Four length values and a color 
  /// 
  /// `<length> | <length> | <length> | <length> | <color> `
  factory BoxShadow.fourLengthColor({
    required CssUnit length1,
    required CssUnit length2,
    required CssUnit length3,
    required CssUnit length4,
    required CssColor color,
  }) {
    return BoxShadow([
      length1.css,
      length2.css,
      length3.css,
      length4.css,
      color.css,
    ]);
  }
  /// inset, length values, and a color 
  /// 
  /// `<inset> | <length> | <length> | <color> `
  /// ### box-shadow: inset 5em 1em gold;
  factory BoxShadow.insetLengthColor({
    required BoxShadowType type,
    required CssUnit length1,
    required CssUnit length2,
    required CssColor color,
  }) {
    return BoxShadow([type.name, length1.css, length2.css, color.css]);
  }
}

extension BoxShadowCssProperty on CssProperty {
  CssProperty boxShadow(BoxShadow value) => add('box-shadow', value.css);
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
