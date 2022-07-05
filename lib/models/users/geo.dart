import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(createToJson: false)
class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}