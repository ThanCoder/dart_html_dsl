import 'package:dart_html_dsl/src/core/elements/html_element.dart';
import 'package:dart_html_dsl/src/core/elements/inputs/input_element_type.dart';
import 'package:dart_html_dsl/src/core/widgets/html_widget.dart';

class InputElement extends HtmlElement {
  final InputElementType type;
  final String? placeHolder;
  InputElement({
    this.placeHolder,
    Map<String, String>? attributes,
    super.id,
    super.customClass,
    super.style,
    super.onEvent,
    required this.type,
  }) : super(
         child: EmptyWidget(),
         attributes: {
           if (attributes != null) ...attributes,
           if (placeHolder != null) ...{'placeholder': placeHolder},
         },
       );

  @override
  String render() {
    return '<input type="${type.value}" $attrStr/>';
  }
}
