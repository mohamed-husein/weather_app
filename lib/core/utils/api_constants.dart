class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/3.0/';
  static const String apiKey = '111e76f07e2c48a7d42b3fedbf8f9f4f';
  static String weatherApiPath(double lat, double long) =>
      '${ApiConstants.baseUrl}onecall?lat=$lat&lon=$long&exclude=minutely&units=metric&appid=${ApiConstants.apiKey}';

  static String urlIcon(icon) => 'http://openweathermap.org/img/wn/$icon@2x.png';
}
