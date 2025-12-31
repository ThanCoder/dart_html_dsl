import 'package:dart_html_dsl/src/core/elements/others/tag_element.dart';
import 'package:dart_html_dsl/src/core/extensions/css/unit_extensions.dart';
import 'package:dart_html_dsl/src/core/styles/border_radius.dart';
import 'package:dart_html_dsl/src/core/styles/css_color.dart';
import 'package:dart_html_dsl/src/core/styles/css_colors.dart';
import 'package:dart_html_dsl/src/core/styles/css_property.dart';
import 'package:dart_html_dsl/src/core/styles/padding_value.dart';

class Card extends TagElement {
  Card({
    super.key,
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    required super.child,
  }) : super(
         tag: 'div',
         style: CssProperty()
             .backgroundColor(CssColors.hexColor(0x3c3c3c))
             .borderRadius(BorderRadius.all(4.px))
             .padding(Padding.all(0.4.em))
             .addProperty(style),
       );
}
