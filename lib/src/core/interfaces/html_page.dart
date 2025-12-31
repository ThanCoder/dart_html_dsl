import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlPage extends HtmlWidget {
  HtmlWidget? _cachedTree;

  HtmlWidget _tree() {
    _cachedTree ??= build();
    return _cachedTree!;
  }

  final PageProps pageProps;
  HtmlWidget build();

  HtmlPage({required this.pageProps});

  String get getJSScript {
    final events = <String>[];
    collectJsCode(_tree(), events);
    return events.join('\n');
  }

  String get getScopedCss {
    final styles = <String>[];
    collectCsss(_tree(), styles);
    return styles.map((e) => e).join('\n');
  }

  @override
  String render() {
    final tree = _tree(); //call only onces

    final headerTags = (pageProps.headers ?? [])
        .map((e) => e.render())
        .join('');
    final cssStyleTags = (pageProps.cssStyles ?? [])
        .map((e) => e.render())
        .join('');
    final scriptTags = (pageProps.scripts ?? [])
        .map((e) => e.render())
        .join('');
    final html =
        '''
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

    ${tree.render()}

    $scriptTags
    ${getJSScript.isEmpty ? '' : '<script>$getJSScript</script>'}
</body>
</html>
''';
    if (pageProps.minify) {
      return // remove new lines
      html
          .replaceAll(RegExp(r'\n+'), '')
          // collapse multiple spaces
          .replaceAll(RegExp(r'\s{2,}'), ' ')
          // remove space between tags
          .replaceAll(RegExp(r'>\s+<'), '><')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim();
    }
    return html.trim();
  }
}
