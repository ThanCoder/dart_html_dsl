import 'package:dart_html_dsl/src/core/elements/inputs/input_element.dart';
import 'package:dart_html_dsl/src/core/elements/inputs/input_element_type.dart';

class InputText extends InputElement {
  InputText({
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
    super.placeHolder,
    super.attributes,
  }) : super(type: InputElementType.text);
}
