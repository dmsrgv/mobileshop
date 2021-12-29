import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(55.75370964839238, 37.6314958939642);
  final _markers = {
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(55.753518441030685, 37.78337376105113),
        infoWindow: InfoWindow(title: 'Название', snippet: 'Адрес')),
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(55.81602376750651, 37.53285688700506),
        infoWindow: InfoWindow(title: 'Название', snippet: 'Адрес')),
    const Marker(
        markerId: MarkerId('3'),
        position: LatLng(55.80548243767813, 37.76609644558336),
        infoWindow: InfoWindow(title: 'Название', snippet: 'Адрес')),
    const Marker(
        markerId: MarkerId('4'),
        position: LatLng(55.67523782093077, 37.55099079370418),
        infoWindow: InfoWindow(title: 'Название', snippet: 'Адрес')),
    const Marker(
        markerId: MarkerId('5'),
        position: LatLng(55.67312216335402, 37.76797236696603),
        infoWindow: InfoWindow(title: 'Название', snippet: 'Адрес')),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: GoogleMap(
          markers: _markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 10.0)),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
