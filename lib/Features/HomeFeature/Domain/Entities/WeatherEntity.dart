class WeatherEntity {
  final double tempC;
  final double windKph;
  final int humidity;
  final double uv;
  final double feelslikeC;
  final double visKm;
  final double pressureMb;
  final String lastUpdated;
  final String icon;

  WeatherEntity({
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.uv,
    required this.feelslikeC,
    required this.visKm,
    required this.pressureMb,
    required this.lastUpdated,
    required this.icon,
  });

  factory WeatherEntity.init() {
    return WeatherEntity(
      tempC: 0,
      windKph: 0,
      humidity: 0,
      uv: 0,
      feelslikeC: 0,
      visKm: 0,
      pressureMb: 0,
      lastUpdated: "",
      icon: "",
    );
  }
}
