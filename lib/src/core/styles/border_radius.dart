import 'package:dart_html_dsl/src/core/enums/css_global_value.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';
import 'package:dart_html_dsl/src/core/styles/css_property.dart';
import 'package:dart_html_dsl/src/core/styles/css_unit.dart';

class BorderRadius with CssValueMixin {
  final List<String> parts;
  const BorderRadius(this.parts);

  factory BorderRadius.globalValue(CssGlobalValue value) =>
      BorderRadius([value.css]);

  /* Radius is set for all 4 sides */
  factory BorderRadius.all(CssUnit value) {
    return BorderRadius([value.css]);
  }

  /* top-left-and-bottom-right | top-right-and-bottom-left  */
  factory BorderRadius.symmetric({
    CssUnit topLeftBottomRight = const Px(0),
    CssUnit topRightBottomLeft = const Px(0),
  }) {
    return BorderRadius([topLeftBottomRight.css, topRightBottomLeft.css]);
  }

  /* top-left | top-right | bottom-right | bottom-left */
  factory BorderRadius.only({
    CssUnit topLeft = const Px(0),
    CssUnit topRight = const Px(0),
    CssUnit bottomRight = const Px(0),
    CssUnit bottomLeft = const Px(0),
  }) {
    return BorderRadius([
      topLeft.css,
      topRight.css,
      bottomRight.css,
      bottomLeft.css,
    ]);
  }

  ///
  /* The syntax of the second radius allows one to four values */
  /* (first radius values) / radius */
  ///border-radius: 10px / 20px;
  ///
  /* (first radius values) / top-left-and-bottom-right | top-right-and-bottom-left */
  ///border-radius: 10px 5% / 20px 30px;
  ///
  /* (first radius values) / top-left | top-right-and-bottom-left | bottom-right */
  ///border-radius: 10px 5px 2em / 20px 25px 30%;
  ///
  /* (first radius values) / top-left | top-right | bottom-right | bottom-left */
  ///border-radius: 10px 5% / 20px 25em 30px 35em;
  factory BorderRadius.oneFourValues({
    required List<CssUnit> radiusValues,
    required List<CssUnit> positionValues,
  }) {
    final radius = radiusValues.map((e) => e.css).join(' ');
    final positions = positionValues.map((e) => e.css).join(' ');
    return BorderRadius([radius, '/', positions]);
  }

  @override
  String get css => parts.join(' ');
}

extension BorderRadiusCssProperty on CssProperty {
  CssProperty borderRadius(BorderRadius value) =>
      add('border-radius', value.css);
}

/**
 * /* The syntax of the first radius allows one to four values */
/* Radius is set for all 4 sides */
border-radius: 10px;

/* top-left-and-bottom-right | top-right-and-bottom-left */
border-radius: 10px 5%;

/* top-left | top-right-and-bottom-left | bottom-right */
border-radius: 2px 4px 2px;

/* top-left | top-right | bottom-right | bottom-left */
border-radius: 1px 0 3px 4px;

/* The syntax of the second radius allows one to four values */
/* (first radius values) / radius */
border-radius: 10px / 20px;

/* (first radius values) / top-left-and-bottom-right | top-right-and-bottom-left */
border-radius: 10px 5% / 20px 30px;

/* (first radius values) / top-left | top-right-and-bottom-left | bottom-right */
border-radius: 10px 5px 2em / 20px 25px 30%;

/* (first radius values) / top-left | top-right | bottom-right | bottom-left */
border-radius: 10px 5% / 20px 25em 30px 35em;

/* Global values */
border-radius: inherit;
border-radius: initial;
border-radius: revert;
border-radius: revert-layer;
border-radius: unset;
 */
