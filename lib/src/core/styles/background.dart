import 'package:dart_html_dsl/src/core/index.dart';
import 'package:dart_html_dsl/src/core/mixins/css_value_mixin.dart';

class Background with CssValueMixin {
  final List<String> parts;
  const Background(this.parts);

  @override
  String get css => parts.join(' ');

  factory Background.globalValue(CssGlobalValue value) {
    return Background([value.css]);
  }

  /// ### Using a `<background-color>`
  /// background: green;
  factory Background.color(CssColor color) {
    return Background([color.css]);
  }

  /// ### Using a `<bg-image>` and `<repeat-style> `
  ///  background: url("test.jpg") repeat-y;
  factory Background.url(CssUrl url, {BgRepeat repeat = BgRepeat.repeatY}) {
    return Background([url.css, repeat.css]);
  }

  /// ###  Using a `<visual-box>` and `<'background-color'> `
  /// background: border-box red;
  factory Background.visualBox({
    required BackgroundClip clip,
    required CssColor color,
  }) {
    return Background([clip.css, color.css]);
  }

  /// ###  A single image, centered and scaled
  /// background: no-repeat center/80% url("../img/image.png");
  factory Background.image({
    required BackgroundClip clip,
    required CssColor color,
  }) {
    return Background([clip.css, color.css]);
  }
}

extension BackgroundCssProperty on CssProperty {
  CssProperty background(Background value) => add('background', value.css);
}

/*
 *  Using a <background-color>
background: green;

 Using a <bg-image> and <repeat-style> 
background: url("test.jpg") repeat-y;

 Using a <visual-box> and <'background-color'> 
background: border-box red;

 A single image, centered and scaled 
background: no-repeat center/80% url("../img/image.png");

 Global values 
background: inherit;
background: initial;
background: revert;
background: revert-layer;
background: unset;
*/
