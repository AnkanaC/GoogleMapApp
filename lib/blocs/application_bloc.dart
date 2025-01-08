import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/models/places_search.dart';
import 'package:myapp/services/geolocator_services.dart';
import 'package:myapp/services/places_services.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorServices();
  final placesServices = PlacesServices();

  Position currentLocation = Position(
      latitude: 22.5744,
      longitude: 88.3629,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0); //for current Location of user

  List<PlacesSearch> searchResults = [];

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentPosition();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults =  placesServices.getAutoComplete(searchTerm) as List<PlacesSearch>;
    notifyListeners();
  }
}
