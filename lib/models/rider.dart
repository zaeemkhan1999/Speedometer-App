import 'dart:convert';

Rider riderFromJson(String str) => Rider.fromJson(json.decode(str));

class Rider {
  Rider({
    required this.name,
    required this.licenseNumber,
    required this.email,
    required this.age,
  });

  String name;
  String licenseNumber;
  String email;
  String age;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        name: json["name"],
        licenseNumber: json["licenseNumber"],
        email: json["email"],
        age: json["age"],
      );
}
