import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlPage extends HtmlWidget {
  final PageProps pageProps;

  HtmlPage({required this.pageProps});

  @override
  String renderHtml() {
    final headerTags = (pageProps.headers ?? [])
        .map((e) => e.renderHtml())
        .join('');
    final cssStyleTags = (pageProps.cssStyles ?? [])
        .map((e) => e.renderHtml())
        .join('');
    final scriptTags = (pageProps.jsScripts ?? [])
        .map((e) => e.renderHtml())
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
    $cssScript
    </style>
</head>
<body>

    ${tree().renderHtml()}

    $scriptTags
    ${jsScript.isEmpty ? '' : '<script>$jsScript</script>'}
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
