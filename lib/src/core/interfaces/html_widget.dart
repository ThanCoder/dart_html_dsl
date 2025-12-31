import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlWidget {
  String render();
  String renderJs() => render();

  void collectCsss(HtmlWidget widget, List<String> outCss) {
    // print('html css widget: $widget');
    if (widget is CssStyle) {
      outCss.add(widget.css);
    }
    if (widget is JsStateful) {
      outCss.add(widget.globalCss);
    }
    if (widget is HtmlElement) {
      if (widget.getScopedStyle != null) {
        outCss.add(widget.getScopedStyle!.css);
      }
      if (widget.child != null) {
        collectCsss(widget.child!, outCss);
      }
    }
    if (widget is ListElement) {
      for (final item in widget.children) {
        collectCsss(item, outCss);
      }
    }
  }

  void collectJsCode(HtmlWidget widget, List<String> out) {
    // print('html widget: $widget');
    if (widget is JsStateful) {
      out.add(widget.jsSource());
      return; // ✅ early return
    }
    if (widget is JsScriptCode) {
      out.add((widget as JsScriptCode).jsSource());
    }

    if (widget is HtmlElement) {
      if (widget.bindings.isNotEmpty) {
        out.addAll(widget.bindings.map((e) => e.jsSource(ele: widget)));
      }
      if (widget.child != null) {
        collectJsCode(widget.child!, out);
      }
    }

    if (widget is ListElement) {
      for (final w in widget.children) {
        collectJsCode(w, out);
      }
    }
  }

  String escapeJs(String html) {
    return html
        .replaceAll('\\', r'\\')
        .replaceAll('`', r'\`')
        .replaceAll('\$', r'\$')
        .replaceAll('\\\$', '\$')
        .replaceAll('\n', '');
  }
}

class EmptyWidget extends HtmlWidget {
  @override
  String render() => '';
}
