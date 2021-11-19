library rx_state;

import 'src/rx_impl.dart';

export 'src/rx_obs_widget.dart';

class Rx<T> extends RxImpl<T> {
  Rx(T initial) : super(initial);

  @override
  dynamic toJson() {
    try {
      return (value as dynamic)?.toJson();
    } on Exception catch (_) {
      throw '$T has not method [toJson]';
    }
  }
}

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
