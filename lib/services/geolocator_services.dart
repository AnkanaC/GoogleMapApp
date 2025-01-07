import 'package:geolocator/geolocator.dart';

class GeolocatorServices {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:120810841.
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
