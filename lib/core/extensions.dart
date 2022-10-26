extension StringExtension on String {
  String get pathReference => split("/").last;
}
