import 'package:flutter/material.dart';
import 'package:geolocation_in_range/data/contacts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(GeolocationApp());

class GeolocationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: MapWidget(),
            ),
            // skip the me contact in the list
            Container(
              height: 250.0,
              child: ListView.builder(
                itemCount: contacts.length - 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: <Widget>[
                        Text(
                          contacts[index + 1].name,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Set<Marker> _markers = contacts.map((contact) {
    return Marker(
      markerId: MarkerId(contact.id),
      position: LatLng(contact.position.latitude, contact.position.longitude),
      infoWindow: InfoWindow(title: contact.name),
      onTap: () {},
    );
  }).toSet();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(48.776870, 9.176813),
          zoom: 15,
          bearing: 15.0,
          tilt: 75.0,
        ),
        markers: _markers,
      ),
    );
  }
}
