import 'package:dart_html_dsl/dart_html_dsl.dart';

mixin CacheTreeMixin {
  HtmlWidget? _cachedTree;

  HtmlWidget tree() {
    _cachedTree ??= build();
    return _cachedTree!;
  }

  HtmlWidget build();
}
