import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junkjar/utils/Colours.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController mapController;
  final Map<String, Marker> markers = {};
  final LatLng _center = const LatLng(19.107392, 72.837796);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getLocation();
  }
  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    var marker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(220.0),
      markerId: MarkerId("curr_loc"),
      position: LatLng(currentLocation.latitude, currentLocation.longitude),
      infoWindow: InfoWindow(title: 'Your Location'),
    );

    setState(() {
      markers['0'] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User and Dustbin location'),
          backgroundColor: ShadowColors.dark,
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: markers.values.toSet(),
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: _getLocation,
//          tooltip: 'Get Location',
//          child: Icon(Icons.flag),
//        ),
      ),
    );
  }
}

