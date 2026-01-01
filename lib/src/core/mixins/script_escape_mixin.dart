mixin ScriptEscapeMixin {
  String escapeJs(String html) {
    return html
        .replaceAll('\\', r'\\')
        .replaceAll('`', r'\`')
        .replaceAll('\$', r'\$')
        .replaceAll('\\\$', '\$')
        .replaceAll('\n', '');
  }
}
