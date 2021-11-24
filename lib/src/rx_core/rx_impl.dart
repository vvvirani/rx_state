import 'dart:async';

import 'rx_interface.dart';
import 'rx_stream.dart';

class Rx<T> extends _RxImpl<T> {
  Rx(T initial) : super(initial);
}

mixin NotifyManager<T> {
  RxStream<T> subject = RxStream<T>();
  final _subscriptions = <RxStream, List<StreamSubscription>>{};

  bool get canUpdate => _subscriptions.isNotEmpty;

  void addListener(RxStream<T> rx) {
    if (!_subscriptions.containsKey(rx)) {
      final subs = rx.listen((data) {
        if (!subject.isClosed) subject.add(data);
      });
      final listSubscriptions = _subscriptions[rx] ??= <StreamSubscription>[];
      listSubscriptions.add(subs);
    }
  }

  StreamSubscription<T> listen(
    void Function(T) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return subject.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError ?? false,
    );
  }

  void close() {
    _subscriptions.forEach((getStream, _subscriptions) {
      for (final subscription in _subscriptions) {
        subscription.cancel();
      }
    });

    _subscriptions.clear();
    subject.close();
  }
}

mixin RxObjectMixin<T> on NotifyManager<T> {
  late T _value;

  void refresh() {
    subject.add(value);
  }

  T call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  bool firstRebuild = true;

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool operator ==(Object o) {
    if (o is T) return value == o;
    if (o is RxObjectMixin<T>) return value == o.value;
    return false;
  }

  @override
  int get hashCode => _value.hashCode;

  set value(T val) {
    if (subject.isClosed) return;
    if (_value == val && !firstRebuild) return;
    firstRebuild = false;
    _value = val;

    subject.add(_value);
  }

  T get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }

  Stream<T> get stream {
    return subject.stream;
  }

  StreamSubscription<T> listenAndPump(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final subscription = listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );

    subject.add(value);

    return subscription;
  }

  void bindStream(Stream<T> stream) {
    final listSubscriptions =
        _subscriptions[subject] ??= <StreamSubscription>[];
    listSubscriptions.add(stream.listen((va) => value = va));
  }
}

class RxNotifier<T> = RxInterface<T> with NotifyManager<T>;

abstract class _RxImpl<T> extends RxNotifier<T> with RxObjectMixin<T> {
  _RxImpl(T initial) {
    _value = initial;
  }

  void addError(Object error, [StackTrace? stackTrace]) {
    subject.addError(error, stackTrace);
  }

  Stream<R> map<R>(R mapper(T? data)) => stream.map(mapper);

  void update(void fn(T? val)) {
    fn(_value);
    subject.add(_value);
  }

  void trigger(T v) {
    var firstRebuild = this.firstRebuild;
    value = v;
    if (!firstRebuild) {
      subject.add(v);
    }
  }
}
