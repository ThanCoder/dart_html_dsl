import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class JsStatefulComponent extends HtmlWidget implements JsScriptCode {
  late final String componentStatefulId = ComponentBuildId.next();

  String get componentSelector =>
      '[component-stateful-id="$componentStatefulId"]';

  @override
  String renderHtml() {
    return '<div component-stateful-id="$componentStatefulId"></div>';
  }

  @override
  String jsSource() {
    ComponentBuildId.reset();

    final builded = tree();
    final template = escapeJs(builded.renderHtml());

    return '''
function create${componentStatefulId}Component(key, root) {
        window[key] = {
          root,
          state: {
            count: 0,
            age: 28,
          },

          setState(next) {
            Object.assign(this.state, next);
            this.renderHtml();
          },

          renderHtml() {
            this.root.innerHTML = `$template`;
            this.bind();
          },

          bind() {
          $jsScript
          },
        };

        window[key].renderHtml();
      }

      create${componentStatefulId}Component(
        $componentStatefulId,
        document.querySelector($componentSelector)
      );''';
  }
}

class ComponentBuildId {
  static int _i = 0;

  static void reset() {
    _i = 0;
  }

  static String next() {
    return 's_${_i++}';
  }
}

class JsCallComponentState extends JsCall {
  final String name;
  final dynamic value;

  ///
  /// ### Example
  /// ```dart
  /// this.setState({ $name: this.state.$value});
  /// ```
  ///
  JsCallComponentState(this.name, this.value);
  @override
  String get expression => '''
              window[key].setState({
                count: window[key].state.count - 1,
              });''';
}
