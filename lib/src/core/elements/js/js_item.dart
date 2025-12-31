class JsItem {
  final String name; // JS variable name

  const JsItem(this.name);

  String get(String key) => '\${$name.$key}';

  String index() => '\${index}';
}
