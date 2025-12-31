import 'dart:io';

import 'package:dart_html_dsl/src/core/index.dart';

import 'home_page.dart';

final h1Key = DomKey();

void main() {
  final html = HomePage(
    pageProps: PageProps(title: 'Dart Html DSL', minify: false),
  );

  final file = File('index.html');
  file.writeAsString(html.render());
}
