import 'package:geolocator/geolocator.dart';
import 'package:weather/weather/models/models.dart';

class LocationRepository {
  Future<Location> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are not enabled");
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is permanently denied");
    }

    final position = await Geolocator.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
