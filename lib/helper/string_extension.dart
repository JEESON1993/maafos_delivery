extension StringExtension on String {
  String get capitalise =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get upperCase => this.toUpperCase();
  String get capitalizeAll => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.capitalise)
      .join(" ");
}
