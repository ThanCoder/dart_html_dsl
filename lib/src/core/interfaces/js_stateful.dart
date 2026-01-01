import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class JsStateful extends HtmlWidget implements JsScriptCode {
  late final String statefulId =
      'astro_ele_${_BuildId.next()}'; // ✅ always unique
  late final String jsClassName = 'C_$statefulId'; // ✅ unique class

  ///
  /// ### For Javascript Object
  ///
  Map<String, dynamic> get initialState => {};

  String get statefulSelector => '[stateful-id="$statefulId"]';

  @override
  String renderHtml() {
    return '<div stateful-id="$statefulId"></div>';
  }

  dynamic getState(String key) => '\${this.state.$key}';

  @override
  String jsSource() {
    _BuildId.reset(); // ✅ အရမ်းအရေးကြီး

    final stateJs = initialState.entries
        .map((e) => '${e.key}: ${_jsValue(e.value)}')
        .join(',');
    final builded = tree();
    final template = escapeJs(builded.renderHtml());

    return '''
  class $jsClassName {
    constructor(root) {
      this.root = root;
      this.state = { $stateJs };
      this.renderHtml();
    }

    setState(next) {
      Object.assign(this.state, next);
      this.renderHtml();
    }

    renderHtml() {
      const state = this.state;
      this.root.innerHTML = `$template`;
      this.bind();
    }

    bind() {
      $jsScript
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

class _BuildId {
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
