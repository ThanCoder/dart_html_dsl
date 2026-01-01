import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

class CssUrl with CssValueMixin {
  final String url;
  CssUrl(this.url);

  @override
  String get css => 'url("$url")';
}
