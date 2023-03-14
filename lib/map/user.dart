import 'package:flutter/material.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

import 'package:google_maps_flutter/google_maps_flutter.dart';
const LatLng currentState=LatLng(9.022174065084474, 38.83556926764894);
class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapScreenState();
  }
}

class MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MAP ")),
      body:GoogleMap(initialCameraPosition: CameraPosition(target:currentState,zoom: 15)),
    );
  }
}