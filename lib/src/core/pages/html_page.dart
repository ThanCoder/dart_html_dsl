import 'package:dart_html_dsl/src/core/elements/widgets/column_widget.dart';
import 'package:dart_html_dsl/src/core/elements/html_element.dart';
import 'package:dart_html_dsl/src/core/elements/inputs/input_form.dart';
import 'package:dart_html_dsl/src/core/elements/widgets/grid_widget.dart';
import 'package:dart_html_dsl/src/core/elements/widgets/row_widget.dart';
import 'package:dart_html_dsl/src/core/pages/page_props.dart';
import 'package:dart_html_dsl/src/core/styles/css_style.dart';
import 'package:dart_html_dsl/src/core/widgets/html_widget.dart';
import 'package:dart_html_dsl/src/core/widgets/list_widget.dart';

abstract class HtmlPage extends HtmlWidget {
  final PageProps pageProps;
  final HtmlWidget body;
  HtmlPage({required this.pageProps, required this.body});

  void _collectCsss(HtmlWidget widget, List<CssStyle> outCss) {
    if (widget is CssStyle) {
      outCss.add(widget);
    }
    if (widget is HtmlElement) {
      if (widget.getScopedStyle != null) {
        outCss.add(widget.getScopedStyle!);
      }
      if (widget.child != null) {
        _collectCsss(widget.child!, outCss);
      }
    }
    if (widget is ListWidget) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
    if (widget is ColumnWidget) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
    if (widget is RowWidget) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
    if (widget is GridWidget) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
  }

  void _collectEvents(HtmlWidget widget, List<HtmlWidget> out) {
    if (widget is HtmlElement) {
      if (widget.bindings.isNotEmpty) {
        out.addAll(widget.bindings);
      }
      if (widget.child != null) {
        _collectEvents(widget.child!, out);
      }
    }

    if (widget is ListWidget) {
      for (final w in widget.children) {
        _collectEvents(w, out);
      }
    }
    if (widget is InputForm) {
      for (final w in widget.children) {
        _collectEvents(w, out);
      }
    }
    if (widget is ColumnWidget) {
      for (final item in widget.children) {
        _collectEvents(item, out);
      }
    }
    if (widget is RowWidget) {
      for (final item in widget.children) {
        _collectEvents(item, out);
      }
    }
    if (widget is GridWidget) {
      for (final item in widget.children) {
        _collectEvents(item, out);
      }
    }
  }

  String get getJSScript {
    final events = <HtmlWidget>[];
    _collectEvents(body, events);

    return events.map((e) => e.render()).join('');
  }

  String get getScopedCss {
    final styles = <CssStyle>[];
    _collectCsss(body, styles);
    return styles.map((e) => e.css).join('');
  }

  @override
  String render() {
    final headerTags = (pageProps.headers ?? [])
        .map((e) => e.render())
        .join('');
    final cssStyleTags = (pageProps.cssStyles ?? [])
        .map((e) => e.render())
        .join('');
    final scriptTags = (pageProps.scripts ?? [])
        .map((e) => e.render())
        .join('');
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageProps.title}</title>
    $headerTags

    <style>
    $cssStyleTags
    $getScopedCss
    </style>
</head>
<body>

    ${body.render()}

    $scriptTags
    ${getJSScript.isEmpty ? '' : '<script>$getJSScript</script>'}
</body>
</html>
''';
  }
}
