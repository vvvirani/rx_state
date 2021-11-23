import 'package:rx_state/src/rx_core/rx_impl.dart';

class RxDouble extends Rx<double> {
  RxDouble(double initial) : super(initial);

  @override
  String toString() {
    return value.toString();
  }

  double sign() {
    return value.sign;
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

  int ceil() {
    return value.ceil();
  }

  int compareTo(num other) {
    return value.compareTo(other);
  }

  int floor(num other) {
    return value.floor();
  }

  int round() {
    return value.round();
  }

  int toInt(int modulus) {
    return value.toInt();
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
