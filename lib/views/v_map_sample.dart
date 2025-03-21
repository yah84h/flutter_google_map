part of './../utils/imports/u_imports.dart';

class ViewMapSample extends StatefulWidget {
  const ViewMapSample({super.key});

  @override
  State<ViewMapSample> createState() => _ViewMapSampleState();
}

class _ViewMapSampleState extends State<ViewMapSample> {
  final ControllerGoogleMap _mapController = ControllerGoogleMap();

  @override
  void initState() {
    super.initState();
    _mapController.loadMapStyle().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: ControllerGoogleMap.initialPosition,
        style: _mapController.mapStyle,
        onMapCreated: (GoogleMapController controller) {
          _mapController.controllerCompleter.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mapController.moveToRedSeaMall,
        child: const Icon(Icons.directions),
      ),
    );
  }
}
