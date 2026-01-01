import 'package:dart_html_dsl/dart_html_dsl.dart';

class PageProps {
  final String title;
  final List<HtmlScript>? headers;
  final List<HtmlWidget>? cssStyles;
  final List<HtmlScript>? jsScripts;
  final bool minify;
  PageProps({
    this.title = 'Untitled',
    this.headers,
    this.cssStyles,
    this.jsScripts,
    this.minify = true,
  });
}


