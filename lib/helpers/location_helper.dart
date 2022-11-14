const String apiKey = '3nmk8Icbt0S68ML7Ib3LvsMQHSAempKO';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude = 0.0, double longitude = 0.0}) {
    return 'https://www.mapquestapi.com/staticmap/v5/map?key=$apiKey&size=170,200@2x&locations=$latitude,$longitude&defaultMarker=marker-num';
  }
}
