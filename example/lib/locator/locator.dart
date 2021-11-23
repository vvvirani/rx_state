import 'package:example/providers/data_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

class DependenyInjection {
  DependenyInjection._();

  static void init() {
    locator.registerSingleton<DataProvider>(DataProvider());
  }
}
