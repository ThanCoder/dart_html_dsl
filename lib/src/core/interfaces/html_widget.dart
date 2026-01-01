import 'package:dart_html_dsl/src/core/mixins/cache_tree_mixin.dart';
import 'package:dart_html_dsl/src/core/mixins/render_js_mixin.dart';
import 'package:dart_html_dsl/src/core/mixins/script_collector_mixin.dart';
import 'package:dart_html_dsl/src/core/mixins/script_escape_mixin.dart';

abstract class HtmlWidget
    with
        ScriptCollectorMixin,
        CacheTreeMixin,
        RenderJsMixin,
        ScriptEscapeMixin {
  @override
  HtmlWidget build() => EmptyWidget();

  @override
  String get cssScript {
    final out = <String>{};
    collectCsss(tree(), out);
    return out.join('\n');
  }

  @override
  String get jsScript {
    final codes = <String>{};
    collectJsCode(tree(), codes);
    return codes.join('\n');
  }
}

class EmptyWidget extends HtmlWidget {
  @override
  String renderHtml() => '';
}
