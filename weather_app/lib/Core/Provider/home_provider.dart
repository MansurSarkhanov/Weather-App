import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Core/Models/weather_model.dart';
import 'package:weather_app/Core/Service/Network/network_service.dart';

import '../DI/injection.dart';

class HomeProvider extends ChangeNotifier {
  final _networkService = getIt.get<NetworkService>();
  WeatherModel? currentModel;
  String? date;
  bool isLoading = true;

  Future<String> getLocation() async {
    LocationPermission permission;
    String latlon;
    await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    final location = await Geolocator.getCurrentPosition();
    latlon = '${location.latitude.toString()},${location.longitude.toString()}';
    print(latlon);

    return latlon;
  }

  Future<void> getWeather() async {
    final location = await getLocation();
    final result = await _networkService.fetchWeather(location);

    currentModel = result.$1;
    date = result.$2;

    if (currentModel != null && date != null) {
      isLoading = false;
      print(isLoading);

      print(currentModel?.location?.country);
      notifyListeners();
    }
  }
}
