import 'package:rx_state/src/rx_core/rx_impl.dart';

class RxBool extends Rx<bool> {
  RxBool(bool initial) : super(initial);

  @override
  String toString() {
    return value ? 'true' : 'false';
  }

  void toggle() {
    subject.add(value = !value);
  }
}
