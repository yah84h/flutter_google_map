part of './../utils/imports/u_imports.dart';

class ControllerGoogleMap {
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(21.682755989045567, 39.167291247434946),
    zoom: 14.5,
  );

  String? mapStyle;

  Future<void> loadMapStyle() async {
    try {
      final style = await rootBundle.loadString('assets/json/map_style.json');
      mapStyle = style;
    } catch (e) {
      debugPrint('❌ Error loading style: $e');
    }
  }

  Future<void> moveToRedSeaMall() async {
    final controller = await controllerCompleter.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(21.629025787812687, 39.112061353854045),
          zoom: 17.0,
        ),
      ),
    );
  }
}
