class FormattedTextAreaOptions {
  FormattedTextAreaOptions({
    this.hasBold = true,
    this.hasItalics = true,
    this.hasUnderline = true,
  });

  final bool hasBold;
  final bool hasItalics;
  final bool hasUnderline;

  bool get hasAnyOption => hasBold || hasItalics || hasUnderline;
}
