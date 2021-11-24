import 'dart:async';

import 'package:flutter/material.dart';

import 'rx_impl.dart';
import 'rx_stream.dart';

abstract class RxInterface<T> {
  bool get canUpdate;

  void addListener(RxStream<T> rx);

  void close();

  static RxInterface? proxy;

  StreamSubscription<T> listen(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError});

  static T notifyChildren<T>(RxNotifier observer, ValueGetter<T> builder) {
    final _observer = RxInterface.proxy;
    RxInterface.proxy = observer;
    final result = builder();
    if (!observer.canUpdate) {
      RxInterface.proxy = _observer;
      throw 'Error';
    }
    RxInterface.proxy = _observer;
    return result;
  }
}
