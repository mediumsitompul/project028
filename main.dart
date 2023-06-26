import 'package:flutter/material.dart';
import 'package:location/location.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Get Current latLng")),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationData? _userLocation;

  Future<void> _getUserLocation() async {
    Location location = Location();
    final _locationData = await location.getLocation();
    setState(() {
      _userLocation = _locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _getUserLocation,
                child: const Center(child: Text("Get Current latLng"))),
            _userLocation != null
                ? Wrap(
                    children: [
                      Text("Your Latitude: ${_userLocation?.latitude}"),
                      Text("Your Longitude: ${_userLocation?.longitude}"),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
