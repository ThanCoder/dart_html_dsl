enum CssGlobalValue {
  none('none'),
  inherit('inherit'),
  initial('initial'),
  revert('revert'),
  revertLayer('revert-layer'),
  unset('double');

  final String css;
  const CssGlobalValue(this.css);
}

enum CssWith {
  thin('thin'),
  medium('medium'),
  thick('thick');

  final String css;
  const CssWith(this.css);
}
