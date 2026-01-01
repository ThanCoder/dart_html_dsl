import 'package:dart_html_dsl/dart_html_dsl.dart';

class CssHeaderLink extends HeaderScript {
  const CssHeaderLink({required super.attributes}) : super(tagName: 'link');

  factory CssHeaderLink.attributes(Map<String, String> attributes) {
    return CssHeaderLink(attributes: attributes);
  }

  /// `<link rel="stylesheet" href="style.css" />`

  factory CssHeaderLink.href(String href) {
    return CssHeaderLink(attributes: {'rel': 'stylesheet', 'href': href});
  }

  ///
  /// `<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">`
  ///
  factory CssHeaderLink.shortcutIcon({String href = 'favicon.ico'}) {
    return CssHeaderLink(
      attributes: {
        'rel': 'shortcut icon',
        'href': href,
        'type': 'image/x-icon',
      },
    );
  }

  ///
  /// `<link rel="icon" href="favicon.ico"">`
  ///
  factory CssHeaderLink.icon({String href = 'favicon.ico'}) {
    return CssHeaderLink(attributes: {'rel': 'icon', 'href': href});
  }
}
