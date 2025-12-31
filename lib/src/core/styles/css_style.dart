import 'package:dart_html_dsl/src/core/interfaces/html_widget.dart';
import 'package:dart_html_dsl/src/core/styles/css_collector.dart';
import 'package:dart_html_dsl/src/core/styles/css_property.dart';

class CssStyle extends HtmlWidget {
  final CssScopeType scopeType;
  final String selector;
  final CssProperty cssProperty;
  final Map<String, CssProperty>? pseudos;

  CssStyle.global(this.selector, this.cssProperty)
    : scopeType = CssScopeType.global,
      pseudos = cssProperty.pseudos;

  CssStyle.scoped(this.selector, this.cssProperty)
    : scopeType = CssScopeType.scoped,
      pseudos = cssProperty.pseudos;

  @override
  String render() => css;

  String get css {
    final buffer = StringBuffer();
    // base rule
    if (cssProperty.map.isNotEmpty) {
      buffer.writeln(_renderRule(selector, cssProperty.map));
    }
    // pseudo rules
    pseudos?.forEach((pseudo, prop) {

      buffer.writeln(_renderRule('$selector$pseudo', prop.map));
    });

    return buffer.toString();
  }

  String _renderRule(String selector, Map<String, String> map) {
    final prop = map.entries.map((e) => '  ${e.key}: ${e.value};').join('\n');
    return '''
$selector {
$prop
}
''';
  }
}
