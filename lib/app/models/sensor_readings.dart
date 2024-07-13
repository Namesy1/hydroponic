import 'dart:convert';

class SensorReadings {
  String name;
  double value;
  bool optimal;
  String unit;
  SensorReadings({
    this.name = '',
    this.value = 0.0,
    this.optimal = false,
    this.unit = ''
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'optimal': optimal,
      'unit': unit,
    };
  }

  factory SensorReadings.fromMap(Map<String, dynamic> map) {
    return SensorReadings(
      name: map['name'] ?? '',
      value: map['value'] ?? '',
      optimal: map['optimal'] ?? false,
      unit: map['unit'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SensorReadings.fromJson(String source) =>
      SensorReadings.fromMap(json.decode(source));

  SensorReadings copyWith({
    String? name,
    double? value,
    bool? optimal,
    String? unit,
  }) {
    return SensorReadings(
      name: name ?? this.name,
      value: value ?? this.value,
      optimal: optimal ?? this.optimal,
      unit: unit ?? this.unit,

    );
  }
}

void main(List<String> args) {
  var d = SensorReadings().toMap();
  print('hellow $d');
}
