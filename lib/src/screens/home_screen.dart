import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search Location'
            ),
          ), //for search bar
          Container(
            height: 300.0,
            child: const GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(22.5744, 88.3629)),
              mapType: MapType.normal,
              myLocationEnabled: true
            ),
          ),
        ],
      )
    );
  }
}