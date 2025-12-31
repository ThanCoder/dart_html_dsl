import 'package:dart_html_dsl/dart_html_dsl.dart';

class H1 extends TagElement {
  H1({
    super.key,
    super.id,
    super.customClass,
    super.style,
    super.onEvent,
    super.attributes,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h1');
}

class H2 extends TagElement {
  H2({
    super.key,
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h2');
}

class H3 extends TagElement {
  H3({
    super.key,
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h3');
}

class H4 extends TagElement {
  H4({
    super.key,
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h4');
}
