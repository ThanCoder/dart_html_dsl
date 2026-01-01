import 'package:dart_html_dsl/dart_html_dsl.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

enum BackgroundClipType {
  borderBox('border-box'),
  paddingBox('padding-box'),
  contentBox('content-box'),
  text('text'),
  borderArea('border-area');

  final String css;
  const BackgroundClipType(this.css);
}

class BackgroundClip with CssValueMixin {
  final List<String> parts;
  const BackgroundClip(this.parts);

  @override
  String get css => parts.join(' ');

  factory BackgroundClip.globalValue(CssGlobalValue value) {
    return BackgroundClip([value.css]);
  }
  factory BackgroundClip.type(BackgroundClipType value) {
    return BackgroundClip([value.css]);
  }
}
