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
                  Padding(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2323652824.
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search Location',
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => applicationBloc.searchPlaces,
                    ),
                  ), //for search bar
                  Stack(
                    children: [
                      Container(
                        height: 300.0,
                        child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  applicationBloc.currentLocation.latitude,
                                  applicationBloc.currentLocation.longitude),
                              zoom: 15.0,
                            ),
                            mapType: MapType.normal,
                            myLocationEnabled: true),
                      ),
                      // ignore: unnecessary_null_comparison
                      if (applicationBloc.searchResults != null && applicationBloc.searchResults.length != 0)
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          backgroundBlendMode: BlendMode.darken,
                        ),
                      ),
                      Container(
                        height: 300.0,
                        child: ListView.builder(
                          itemCount: applicationBloc.searchResults.length,
                          itemBuilder: (context, index) {
                            final result = applicationBloc.searchResults[index];
                            return ListTile(
                              title: Text(
                                result.toString(),
                                style: TextStyle(color: Colors.white),
                              ), // Customize based on your data type
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}
