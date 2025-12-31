import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class JsStateful extends HtmlWidget implements JsScriptCode {
  HtmlWidget? _cachedTree;

  HtmlWidget _tree() {
    _cachedTree ??= build();
    return _cachedTree!;
  }

  late final String statefulId =
      'astro_ele_${BuildId.next()}'; // ✅ always unique
  late final String jsClassName = 'C_$statefulId'; // ✅ unique class

  ///
  /// ### For Javascript Object
  ///
  Map<String, dynamic> get initialState => {};

  /// JS template (uses state)
  HtmlWidget build();

  String get statefulSelector => '[stateful-id="$statefulId"]';

  @override
  String render() {
    return '<div stateful-id="$statefulId"></div>';
  }

  dynamic getState(String key) => '\${this.state.$key}';

  String get jsInnerCodes {
    final codes = <String>[];
    collectJsCode(_tree(), codes);
    return codes.join('\n');
  }

  String get globalCss {
    final css = <String>[];
    collectCsss(_tree(), css);
    return css.join('\n');
  }

  @override
  String jsSource() {
    BuildId.reset(); // ✅ အရမ်းအရေးကြီး

    final stateJs = initialState.entries
        .map((e) => '${e.key}: ${_jsValue(e.value)}')
        .join(',');
    final builded = _tree();
    final template = escapeJs(builded.render());

    return '''
  class $jsClassName {
    constructor(root) {
      this.root = root;
      this.state = { $stateJs };
      this.render();
    }

    setState(next) {
      Object.assign(this.state, next);
      this.render();
    }

    render() {
      const state = this.state;
      this.root.innerHTML = `$template`;
      this.bind();
    }

    bind() {
      $jsInnerCodes
    }
  }

  new $jsClassName(document.querySelector('$statefulSelector'));
''';
  }

  String _jsValue(dynamic v) {
    if (v is String) return '"$v"';
    if (v is num || v is bool) return v.toString();
    return 'null';
  }
}

class BuildId {
  static int _i = 0;

  static void reset() {
    _i = 0;
  }

  static String next() {
    return 's_${_i++}';
  }
}

class JsCallState extends JsCall {
  final String name;
  final dynamic value;

  ///
  /// ### Example
  /// ```dart
  /// this.setState({ $name: this.state.$value});
  /// ```
  ///
  JsCallState(this.name, this.value);
  @override
  String get expression => 'this.setState({ $name: this.state.$value});';
}
