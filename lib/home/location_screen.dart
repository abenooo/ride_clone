import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'base_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  final MapController mapController = MapController();
  LatLng? fromLocation;
  LatLng? toLocation;
  String fromAddress = "Select location";
  String toAddress = "Select destination";
  bool isLoading = false;

  List<Map<String, dynamic>> recentPlaces = [
    {
      "name": "Office",
      "address": "Commercial Bank of Ethiopia, 2Q92+4P8, Addis Ababa",
      "distance": 2.7,
      "latLng": LatLng(9.005401, 38.763611),
    },
    {
      "name": "Coffee",
      "address": "Tomoca Coffee, Wawel St, Addis Ababa",
      "distance": 1.8,
      "latLng": LatLng(9.010401, 38.761611),
    },
    {
      "name": "Shopping center",
      "address": "Dubai tera building, Addis Ababa",
      "distance": 4.9,
      "latLng": LatLng(9.015401, 38.762611),
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showErrorDialog('Location permissions are required to use this feature.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showErrorDialog('Location permissions are permanently denied. Please enable them in your device settings.');
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => isLoading = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled. Please enable them in your device settings.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are denied. Please enable them in settings.');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      fromLocation = LatLng(position.latitude, position.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      fromAddress = placemarks.isNotEmpty
          ? "${placemarks[0].street}, ${placemarks[0].locality}"
          : "Location found, address unknown";

      if (fromLocation != null) {
        mapController.move(fromLocation!, 15);
      }
    } catch (e) {
      debugPrint('Error getting location: $e');
      _showErrorDialog('Could not get current location: ${e.toString()}');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _showLocationSearch(BuildContext context) async {
    final result = await showSearch(
      context: context,
      delegate: LocationSearchDelegate(recentPlaces),
    );
    if (result != null) {
      setState(() {
        toLocation = result['latLng'];
        toAddress = result['address'];
        if (toLocation != null) {
          mapController.move(toLocation!, 15);
        }
      });
    }
  }

  double calculateDistance() {
    if (fromLocation != null && toLocation != null) {
      final Distance distance = Distance();
      return distance.as(
        LengthUnit.Kilometer,
        fromLocation!,
        toLocation!,
      );
    }
    return 0.0;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 1, // Bottom navigation index for the Location screen
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(9.005401, 38.763611),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                tileProvider: CancellableNetworkTileProvider(),
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayer(
                markers: [
                  if (fromLocation != null)
                    Marker(
                      point: fromLocation!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_on, color: Colors.blue, size: 40),
                    ),
                  if (toLocation != null)
                    Marker(
                      point: toLocation!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.place, color: Colors.red, size: 40),
                    ),
                ],
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Select address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _getCurrentLocation,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.my_location, color: Colors.grey[700]),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                fromAddress,
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => _showLocationSearch(context),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey[700]),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                toAddress,
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (fromLocation != null && toLocation != null)
                      Text(
                        "Distance: ${calculateDistance().toStringAsFixed(2)} km",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 16),
                    const Text(
                      "Recent places",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...recentPlaces.map((place) => ListTile(
                          leading: Icon(Icons.history, color: Colors.grey[700]),
                          title: Text(place['name']),
                          subtitle: Text("${place['address']} • ${place['distance']} km"),
                          onTap: () {
                            setState(() {
                              toLocation = place['latLng'];
                              toAddress = place['address'];
                              mapController.move(toLocation!, 15);
                            });
                          },
                        )),
                  ],
                ),
              );
            },
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class LocationSearchDelegate extends SearchDelegate<Map<String, dynamic>> {
  final List<Map<String, dynamic>> recentPlaces;

  LocationSearchDelegate(this.recentPlaces);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, {}),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredResults = query.isEmpty
        ? recentPlaces
        : recentPlaces.where((place) {
            final name = place['name'].toString().toLowerCase();
            return name.contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final place = filteredResults[index];
        return ListTile(
          title: Text(place['name']),
          subtitle: Text(place['address']),
          trailing: Text(
            "${place['distance']} km",
            style: const TextStyle(color: Colors.grey),
          ),
          onTap: () {
            close(context, place);
          },
        );
      },
    );
  }
}
