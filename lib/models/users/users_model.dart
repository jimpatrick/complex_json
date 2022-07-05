import 'package:complex_json/models/users/address.dart';
import 'package:complex_json/models/users/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable(createToJson: false)
class UsersModel {
  UsersModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  factory UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);
}






