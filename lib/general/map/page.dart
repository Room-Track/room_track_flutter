import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController = 
    Completer();


  static const LatLng _pGooglePlex = LatLng(-33.0349212872088, -71.59588228381082);
  static const LatLng _pApplePark = LatLng(-33.02215257982356, -71.6336526057028);

  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: _currentP == null
        ? const Center(
            child: Text("Loading..."),
        )
      : GoogleMap(
          onMapCreated: ((controller) => 
              _mapController.complete(controller)),
          initialCameraPosition: const CameraPosition(
            target: _pGooglePlex,
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('_currentLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: _currentP!,
              infoWindow: const InfoWindow(title: "Your Location"),
            ),
            const Marker(
              markerId: MarkerId('_sourceLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: _pGooglePlex,
              infoWindow: InfoWindow(title: "Start"),
            ),
            const Marker(
              markerId: MarkerId('_destionationLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: _pApplePark,
              infoWindow: InfoWindow(title: "To Go"),
          ),
        },
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 15,
    );
    await controller.animateCamera(
    CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates()async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if(_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    }else{
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation){
      if(currentLocation.latitude != null && 
          currentLocation.longitude != null) {
        setState(() {
          _currentP = 
              LatLng(currentLocation.latitude!,currentLocation.longitude! );
          _cameraToPosition(_currentP!);
        });
      }
    });
  }
}
