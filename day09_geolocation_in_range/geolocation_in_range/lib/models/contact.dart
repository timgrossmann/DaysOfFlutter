import 'package:google_maps_flutter/google_maps_flutter.dart';

class Contact {
  String id;
  String name;
  LatLng position;

  Contact(this.id, this.name, this.position);
}