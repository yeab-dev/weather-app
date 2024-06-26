import 'package:get_it/get_it.dart';
import "services.dart";

abstract class InjectionService {
  static final locator = GetIt.instance;

  static injectAll() {
    WeatherRepositoryLocator.inject();
    LocationRepositoryLocator.inject();
  }
}
