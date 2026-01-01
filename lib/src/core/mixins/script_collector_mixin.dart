import 'package:dart_html_dsl/dart_html_dsl.dart';

mixin ScriptCollectorMixin {
  String get cssScript;
  String get jsScript;

  void collectCsss(HtmlWidget widget, Set<String> out) {
    if (widget is JsStateful && widget.cssScript.isNotEmpty) {
      out.add(widget.cssScript);
    }
    if (widget is CssStyle) {
      out.add((widget as CssStyle).css);
    }
    if (widget is HtmlElement && widget.getScopedStyle!.css.isNotEmpty) {
      if (widget.getScopedStyle != null) {
        out.add(widget.getScopedStyle!.css);
      }
      if (widget.child != null) {
        collectCsss(widget.child!, out);
      }
    }
    if (widget is HtmlListElement && widget.cssAllScript.isNotEmpty) {
      out.add(widget.cssAllScript);
    }
  }

  void collectJsCode(HtmlWidget widget, Set<String> out) {
    // print('html widget: $widget');
    if (widget is JsStateful && widget.jsSource().isNotEmpty) {
      out.add(widget.jsSource());
    }
    if (widget is JsScriptCode) {
      final w = (widget as JsScriptCode);
      if (w.jsSource().isNotEmpty) {
        out.add(w.jsSource());
      }
    }

    if (widget is HtmlElement) {
      if (widget.bindings.isNotEmpty) {
        out.addAll(widget.bindings.map((e) => e.jsSource(ele: widget)));
      }
      if (widget.child != null) {
        collectJsCode(widget.child!, out);
      }
    }

    if (widget is HtmlListElement) {
      out.add(widget.jsAllScript);
    }
  }
}
