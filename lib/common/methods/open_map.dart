import 'package:maps_launcher/maps_launcher.dart';

Future<void> openMap({
  required String lat,
  required String lng,
}) async {
  MapsLauncher.launchCoordinates(double.parse(lat), double.parse(lng));
}
