import 'dart:io';

import 'package:dart_html_dsl/src/core/elements/others/header_elements.dart';
import 'package:dart_html_dsl/src/core/elements/widgets/button.dart';
import 'package:dart_html_dsl/src/core/elements/widgets/column_widget.dart';
import 'package:dart_html_dsl/src/core/pages/html5_page.dart';
import 'package:dart_html_dsl/src/core/pages/page_props.dart';
import 'package:dart_html_dsl/src/core/widgets/text.dart';

void main() {
  final html = Html5Page(
    pageProps: PageProps(title: 'Dart Html DSL'),
    body: ColumnWidget(
      children: [
        H1(child: Text('h1 test')),
        Button(text: 'hello'),
      ],
    ),
  );

  final file = File('index.html');
  file.writeAsString(html.render());
}
