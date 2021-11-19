import 'package:rx_state/rx_state.dart';

class RxInt extends Rx<int> {
  RxInt(int initial) : super(initial);

  @override
  String toString() {
    return value.toString();
  }

  bool isEven() {
    return value.isEven;
  }

  bool isOdd() {
    return value.isOdd;
  }

  bool isFinite() {
    return value.isFinite;
  }

  bool isInfinite() {
    return value.isInfinite;
  }

  bool isNaN() {
    return value.isNaN;
  }

  bool isNegative() {
    return value.isNegative;
  }

  int bitLength() {
    return value.bitLength;
  }

  int sign() {
    return value.sign;
  }

  int ceil() {
    return value.ceil();
  }

  int compareTo(num other) {
    return value.compareTo(other);
  }

  int floor(num other) {
    return value.floor();
  }

  int gcd(int other) {
    return value.gcd(other);
  }

  int modInverse(int modulus) {
    return value.modInverse(modulus);
  }

  int modPow(int exponent, int modulus) {
    return value.modPow(exponent, modulus);
  }

  int round() {
    return value.round();
  }

  int toInt(int modulus) {
    return value.toInt();
  }

  int toSigned(int width) {
    return value.toSigned(width);
  }

  int toUnsigned(int width) {
    return value.toUnsigned(width);
  }

  int truncate(int width) {
    return value.truncate();
  }

  double ceilToDouble() {
    return value.ceilToDouble();
  }

  double floorToDouble() {
    return value.floorToDouble();
  }

  double roundToDouble() {
    return value.roundToDouble();
  }

  double toDouble() {
    return value.toDouble();
  }

  double truncateToDouble() {
    return value.truncateToDouble();
  }

  String toRadixString(int radix) {
    return value.toRadixString(radix);
  }

  String toStringAsExponential([int? fractionDigits]) {
    return value.toStringAsExponential(fractionDigits);
  }

  String toStringAsFixed(int fractionDigits) {
    return value.toStringAsFixed(fractionDigits);
  }

  String toStringAsPrecision(int precision) {
    return value.toStringAsPrecision(precision);
  }

  num remainder(num other) {
    return value.remainder(other);
  }

  num clamp(num lowerLimit, num upperLimit) {
    return value.clamp(lowerLimit, upperLimit);
  }
}
