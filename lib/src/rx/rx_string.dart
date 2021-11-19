
import 'package:rx_state/rx_state.dart';

class RxString extends Rx<String> {
  RxString(String initial) : super(initial);

  @override
  String toString() {
    return value.toString();
  }

  bool isEmpty() {
    return value.isEmpty;
  }

  bool isNotEmpty() {
    return value.isNotEmpty;
  }

  int length() {
    return value.length;
  }

  List<int> codeUnits() {
    return value.codeUnits;
  }

  Runes runes() {
    return value.runes;
  }

  String toLowerCase() {
    return value.toLowerCase();
  }

  String toUpperCase() {
    return value.toUpperCase();
  }

  String trim() {
    return value.trim();
  }

  String trimLeft() {
    return value.trimLeft();
  }

  String trimRight() {
    return value.trimRight();
  }

  List<String> split(Pattern pattern) {
    return value.split(pattern);
  }

  String padLeft(int width, [String padding = ' ']) {
    return value.padLeft(width, padding);
  }

  String padRight(int width, [String padding = ' ']) {
    return value.padRight(width, padding);
  }

  String replaceAll(Pattern from, String replace) {
    return value.replaceAll(from, replace);
  }

  String replaceAllMapped(Pattern from, String Function(Match) replace) {
    return value.replaceAllMapped(from, replace);
  }

  String replaceFirst(Pattern from, String to, [int startIndex = 0]) {
    return value.replaceFirst(from, to);
  }

  String replaceFirstMapped(Pattern from, String Function(Match) replace,
      [int startIndex = 0]) {
    return value.replaceFirstMapped(from, replace, startIndex);
  }

  String replaceRange(int start, int? end, String replacement) {
    return value.replaceRange(start, end, replacement);
  }

  String splitMapJoin(Pattern pattern,
      {String Function(Match)? onMatch, String Function(String)? onNonMatch}) {
    return value.splitMapJoin(
      pattern,
      onMatch: onMatch,
      onNonMatch: onNonMatch,
    );
  }

  String substring(int start, [int? end]) {
    return value.substring(start, end);
  }

  Iterable<Match> allMatches(String string, [int start = 0]) {
    return value.allMatches(string, start);
  }

  int codeUnitAt(int index) {
    return value.codeUnitAt(index);
  }

  int compareTo(String other) {
    return value.compareTo(other);
  }

  int indexOf(Pattern pattern, [int start = 0]) {
    return value.indexOf(pattern, start);
  }

  int lastIndexOf(Pattern pattern, [int? start]) {
    return value.lastIndexOf(pattern, start);
  }

  bool contains(Pattern other, [int startIndex = 0]) {
    return value.contains(other, startIndex);
  }

  bool startsWith(Pattern pattern, [int index = 0]) {
    return value.startsWith(pattern, index);
  }

  bool endsWith(String other) {
    return value.endsWith(other);
  }

  Match? matchAsPrefix(String string, [int start = 0]) {
    return value.matchAsPrefix(string, start);
  }

  dynamic noSuchMethod(Invocation invocation) {
    return value.noSuchMethod(invocation);
  }
}
