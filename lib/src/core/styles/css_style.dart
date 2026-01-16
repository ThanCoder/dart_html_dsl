import 'package:dart_html_dsl/src/core/styles/css_collector.dart';
import 'package:dart_html_dsl/src/core/styles/css_property.dart';

class CssStyle {
  final CssScopeType scopeType;
  final String selector;
  final CssProperty cssProperty;
  final Map<String, CssProperty>? pseudos;
  String? cssSource;

  CssStyle.global(this.selector, this.cssProperty)
    : scopeType = CssScopeType.global,
      pseudos = cssProperty.pseudos;

  CssStyle.scoped(this.selector, this.cssProperty)
    : scopeType = CssScopeType.scoped,
      pseudos = cssProperty.pseudos;

  CssStyle.fromSource(this.cssSource)
    : cssProperty = CssProperty(),
      selector = '',
      scopeType = CssScopeType.global,
      pseudos = null;

  String get css {
    if (cssSource != null) {
      return cssSource!;
    }
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
