import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(createToJson: false)
class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}