import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;

  Future getCurrentLocation() async {
    try {
      // Position position = await Geolocator()
      //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // this.latitude = position.latitude;
      // this.longitude = position.longitude;
      // this.latitude = 30.46453533497689;
      // this.longitude = 78.05643754257252;
      this.latitude = 28.680871;
      this.longitude = 77.298668;
    } catch (e) {
      print(e);
    }
  }
}

// String cityName = decodedData['location']['name'];

// int condition = decodedData['current']['condition']['code'];

// double temperature = decodedData['current']['temp_c'];
