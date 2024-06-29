import "package:weather/weather/repositories/_repositories.dart";

import "../services/services.dart";

abstract class LocationRepositoryLocator {
  static inject() {
    InjectionService.locator.registerSingleton<LocationRepository>(
        LocationRepository(),
        instanceName: "locationRepository");
  }

  static LocationRepository get locationRepository {
    return InjectionService.locator<LocationRepository>(
        instanceName: "locationRepository");
  }
}
