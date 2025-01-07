import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/services/geolocator_services.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorServices();

  late Position currentLocation; //for current Location of user

  ApplicationBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async{
    currentLocation = await geolocatorService.getCurrentPosition();
    notifyListeners();
  }
}
