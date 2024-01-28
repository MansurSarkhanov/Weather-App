import 'package:dio/dio.dart';
import 'package:weather_app/Core/Models/weather_model.dart';
import 'package:weather_app/keys.dart';

final class NetworkService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppKeys.baseUrl,
    contentType: 'application/json',
  ));

  Future<WeatherModel?> fetchWeather() async {
    final response = await _dio.get(
      AppKeys.forecastUrl,
      queryParameters: {'q': 'London', 'days': "1"},
    );
    if (response.statusCode == 200) {
      print(response.data);
      final weatherModel = WeatherModel.fromJson(response.data);
      print(weatherModel.location?.country);
      print(weatherModel.current?.condition?.code);

      return weatherModel;
    }
    return null;
  }
}
