import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rx_state/src/rx_core/rx_impl.dart';
import 'package:rx_state/src/rx_core/rx_interface.dart';

typedef WidgetCallback = Widget Function();

class RxObserverBuilder extends ObservableWidget {
  final WidgetCallback builder;
  const RxObserverBuilder({required this.builder});

  @override
  Widget build() {
    return builder();
  }
}

class ObservableValue<T extends RxInterface> extends ObservableWidget {
  final Widget Function(T) builder;
  final T data;

  const ObservableValue(this.builder, this.data, {Key? key}) : super(key: key);

  @override
  Widget build() {
    return builder(data);
  }
}

abstract class ObservableWidget extends StatefulWidget {
  const ObservableWidget({Key? key}) : super(key: key);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(ObjectFlagProperty<Function>.has('builder', build));
  }

  @override
  _ObservableState createState() {
    return _ObservableState();
  }

  @protected
  Widget build();
}

class _ObservableState extends State<ObservableWidget> {
  final _observer = RxNotifier();
  late StreamSubscription subs;

  @override
  void initState() {
    super.initState();
    subs = _observer.listen(_updateTree, cancelOnError: false);
  }

  void _updateTree(_) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    subs.cancel();
    _observer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RxInterface.notifyChildren(_observer, widget.build);
  }
}
