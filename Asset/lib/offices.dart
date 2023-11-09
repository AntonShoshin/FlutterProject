import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'offices.g.dart';

@JsonSerializable()
class OfficesList {
  List<Office> offices;

  OfficesList({required this.offices});

  factory OfficesList.fromJSON(Map<String, dynamic> json) => _$OfficesListFromJson(json);
  Map<String, dynamic> toJson() => _$OfficesListToJson(this);
  // ручная серриализация
  //   {
  //   var officesJson = json['offices'] as List;
  //   List<Office> officesList =
  //       officesJson.map((i) => Office.fromJSON(i)).toList();
  //
  //   return OfficesList(offices: officesList);
  // }
}

@JsonSerializable()
class Office {
  // @JsonKey(name: 'dr');
  // DateTime dateTime;
  final String name;
  final String address;
  final String image;

  Office({required this.name, required this.address, required this.image});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

//  ручная серриализация
  // {
  //   return Office(
  //       name: json['name'] as String,
  //       address: json['address'] as String,
  //       image: json['image'] as String);
  // }
}

Future<OfficesList> getOfficesList() async {
  Uri url = Uri.https('about.google', 'static/data/locations.json');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return OfficesList.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
