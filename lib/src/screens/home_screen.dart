import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/blocs/application_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: (applicationBloc.currentLocation == null)
      ? const Center(child: CircularProgressIndicator())
      : Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search Location'
            ),
          ), //for search bar
          SizedBox(
            height: 300.0,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: 
                LatLng(
                  applicationBloc.currentLocation.latitude,
                  applicationBloc.currentLocation.longitude
                  ),
                  zoom: 15.0,
                ),
              mapType: MapType.normal,
              myLocationEnabled: true
            ),
          ),
        ],
      )
    );
  }
}