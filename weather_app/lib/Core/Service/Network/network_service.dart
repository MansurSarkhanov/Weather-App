import 'package:dio/dio.dart';
import 'package:weather_app/Core/Models/weather_model.dart';
import 'package:weather_app/keys.dart';

final class NetworkService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppKeys.baseUrl,
    contentType: 'application/json',
  ));

  Future<(WeatherModel?, String?)> fetchWeather(String query) async {
    final response = await _dio.get(
      AppKeys.forecastUrl,
      queryParameters: {'q': query, 'days': "1"},
    );
    if (response.statusCode == 200) {
      print(response.data);
      String apiDate = response.headers["Date"]?.first ?? '';
      String dateWithoutGMT = apiDate.replaceFirst(" GMT", "");

      List<String> parts = dateWithoutGMT.split(" ");
      String formattedDate = parts.take(4).join(" ");

      final weatherModel = WeatherModel.fromJson(response.data);
      print(weatherModel.location?.country);
      print(weatherModel.current?.condition?.code);

      return (weatherModel, formattedDate);
    }
    return (null, null);
  }
}
