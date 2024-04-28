// To parse this JSON data, do
//
//     final dataFromWifi = dataFromWifiFromJson(jsonString);

import 'dart:convert';

DataFromWifi dataFromWifiFromJson(String str) {
    final jsonData = json.decode(str);
    return DataFromWifi.fromJson(jsonData);
}

String dataFromWifiToJson(DataFromWifi data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class DataFromWifi {
    String? distance;

    DataFromWifi({
        this.distance,
    });

    factory DataFromWifi.fromJson(Map<String, dynamic> json) => new DataFromWifi(
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
    };
}
