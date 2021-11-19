import 'src/rx_impl.dart';

class RxBool extends Rx<bool> {
  RxBool(bool initial) : super(initial);

  @override
  String toString() {
    return value ? 'true' : 'false';
  }

  Rx<bool> toggle() {
    subject.add(value = !value);
    return this;
  }
}