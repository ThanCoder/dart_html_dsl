import 'package:dart_html_dsl/dart_html_dsl.dart';

abstract class HtmlElement extends HtmlWidget {
  final DomKey? key;
  late final String _domKeyId;

  final HtmlWidget? child;

  final CssProperty? style;

  /// Auto-generated unique scoped class
  late final String scopedId;

  /// Optional HTML id attribute
  final String? id;

  /// Other arbitrary HTML attributes
  final Map<String, String>? attributes;

  /// Optional user-defined custom class
  final String? customClass;

  CssStyle? _scopedStyle;

  final List<JsEvent> onEvent;

  // late final List<JsEventBinding> _bindings;
  late final String _eventId;
  final bool readOnly;
  final bool disabled;

  HtmlElement({
    this.key,
    this.child,
    this.style,
    this.id,
    this.attributes,
    this.customClass,
    this.readOnly = false,
    this.disabled = false,
    this.onEvent = const [],
  }) {
    // scoped style id generate
    // Generate unique scoped class if scopedStyle exists
    if (style != null) {
      scopedId = ScopeId.next();
      _scopedStyle = CssStyle.scoped('.$scopedId', style!);
    } else {
      scopedId = '';
    }

    _eventId = 'astro_ele_${ScopeId.next()}';
    // key
    _domKeyId = 'dk_${ScopeId.next()}';
    if (key != null) {
      key?.bind(this);
    }

    // register events
    // _bindings = onEvent
    //     .map((e) => JsEventBinding(selector: getEventSelector, event: e))
    //     .toList();
  }

  String get jsSelector => '[data-dk="$_domKeyId"]';

  /// event
  // List<JsEventBinding> get bindings => _bindings;
  List<JsEventBinding> get bindings => onEvent
      .map((e) => JsEventBinding(selector: getEventSelector, event: e))
      .toList();

  String get getEventSelector => onEvent.isNotEmpty ? eventSelector : '';

  String get eventSelector => '[data-eid="$_eventId"]';
  String get eventId => _eventId;

  CssStyle? get getScopedStyle => _scopedStyle;

  /// Render class/id/other attributes
  String get attrStr {
    final buffer = StringBuffer();
    // key
    if (key != null) {
      buffer.write(' data-dk="$_domKeyId"');
    }
    // event
    if (getEventSelector.isNotEmpty) {
      buffer.write(' data-eid="$_eventId"');
    }

    // Classes: scoped + custom
    final classes = [
      if (scopedId.isNotEmpty) scopedId,
      if (customClass != null) customClass,
    ];
    if (classes.isNotEmpty) buffer.write(' class="${classes.join(' ')}"');

    // id
    if (id != null) buffer.write(' id="$id"');

    // default attributes
    final allAttributes = <String, dynamic>{};
    // set default
    if (readOnly) {
      allAttributes['readonly'] = 'true';
    }
    if (disabled) {
      allAttributes['disabled'] = 'true';
    }

    // Other attributes
    if (attributes != null) {
      allAttributes.addAll(attributes!);
    }

    allAttributes.forEach((key, value) {
      buffer.write(' $key="$value"');
    });
    return buffer.toString();
  }
}
