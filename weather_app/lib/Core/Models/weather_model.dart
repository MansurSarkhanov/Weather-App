class WeatherModel {
  LocationModel? location;
  CurrentModel? current;
  ForecastModel? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? LocationModel.fromJson(json['location']) : null;
    current = json['current'] != null ? CurrentModel.fromJson(json['current']) : null;
    forecast = json['forecast'] != null ? ForecastModel.fromJson(json['forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}

class LocationModel {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  LocationModel(
      {this.name, this.region, this.country, this.lat, this.lon, this.tzId, this.localtimeEpoch, this.localtime});

  LocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class CurrentModel {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  ConditionModel? condition;
  int? cloud;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? feelslikeC;
  double? feelslikeF;
  int? humidity;
  double? visKm;
  double? visMi;
  double? uv;
  AirModel? airModel;

  CurrentModel(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windDegree,
      this.windDir,
      this.windKph,
      this.humidity,
      this.windMph,
      this.visKm,
      this.visMi,
      this.airModel,

      this.uv});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null ? ConditionModel.fromJson(json['condition']) : null;
    airModel = json['air_quality'] != null ? AirModel.fromJson(json['air_quality']) : null;

    cloud = json['cloud'];
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    humidity = json['humidity'];
    uv = json['uv'];
    visKm = json['vis_km'];
    visMi = json['vis_miles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['cloud'] = cloud;
    return data;
  }
}

class AirModel {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirModel({this.co, this.no2, this.o3, this.so2, this.pm25, this.pm10, this.usEpaIndex, this.gbDefraIndex});

  AirModel.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usEpaIndex = json['us-epa-index'];
    gbDefraIndex = json['gb-defra-index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['co'] = co;
    data['no2'] = no2;
    data['o3'] = o3;
    data['so2'] = so2;
    data['pm2_5'] = pm25;
    data['pm10'] = pm10;
    data['us-epa-index'] = usEpaIndex;
    data['gb-defra-index'] = gbDefraIndex;
    return data;
  }
}

class ForecastModel {
  List<Forecastday>? forecastday;

  ForecastModel({this.forecastday});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  int? dateEpoch;
  DayModel? day;
  AstroModel? astro;
  List<HourModel>? hour;
  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
  });

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];

    astro = json['astro'] != null ? AstroModel.fromJson(json['astro']) : null;

    day = json['day'] != null ? DayModel.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      hour = <HourModel>[];
      json['hour'].forEach((v) {
        hour!.add(HourModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (day != null) {
      data['day'] = day!.toJson();
    }

    return data;
  }
}

class DayModel {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  ConditionModel? conditionModel;

  DayModel(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.conditionModel});

  DayModel.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    conditionModel = json['condition'] != null ? ConditionModel.fromJson(json['condition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;

    return data;
  }
}

class AstroModel {
  String? sunrise;
  String? sunset;

  AstroModel({this.sunrise, this.sunset});

  AstroModel.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class HourModel {
  String? time;
  double? tempC;
  double? tempF;
  ConditionModel? condition;

  HourModel({this.time, this.tempC, this.tempF, this.condition});

  HourModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = json['condition'] != null ? ConditionModel.fromJson(json['condition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    return data;
  }
}

class ConditionModel {
  String? text;
  String? icon;
  int? code;

  ConditionModel({this.text, this.icon, this.code});

  ConditionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}
