import 'package:flutter_social_media_app/users_module/models/address_model.dart';
import 'package:flutter_social_media_app/users_module/models/company_model.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address']),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: Company.fromJson(json['company']),
    );
  }
}
