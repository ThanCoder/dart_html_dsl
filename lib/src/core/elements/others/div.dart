import 'package:dart_html_dsl/dart_html_dsl.dart';

class Div extends TagElement {
  Div({
    super.key,
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'div');
}
