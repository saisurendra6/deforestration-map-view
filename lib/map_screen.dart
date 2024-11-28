import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_data/constants.dart';

class MapScreen extends StatefulWidget {
  final String locataion;
  const MapScreen({super.key, required this.locataion});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(15.582176918337222, 79.07860462951307);

  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    addMarkers();
  }

  void addMarkers() {
    String res = "";
    markers = {};
    for (int i = 0; i < prakasam.length; i++) {
      markers.add(Marker(
          markerId: MarkerId("value$i"),
          position: LatLng(prakasam[i][0], prakasam[i][1])));
      res += "[" +
          prakasam[i][1].toString() +
          "," +
          (prakasam[i][0] + 0.015).toString() +
          "],";
    }
    print(res);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.locataion),
      ),
      body: GoogleMap(
        // zoomControlsEnabled: false,
        // zoomGesturesEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
      ),
    );
  }
}
