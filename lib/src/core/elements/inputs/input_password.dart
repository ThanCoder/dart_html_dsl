import 'package:dart_html_dsl/src/core/elements/inputs/input_element.dart';
import 'package:dart_html_dsl/src/core/elements/inputs/input_element_type.dart';

class InputPassword extends InputElement {
  InputPassword({
    super.className,
    super.id,
    super.onEvent,
    super.style,
    super.placeHolder,
    super.attributes,
  }) : super(type: InputElementType.password);
}
