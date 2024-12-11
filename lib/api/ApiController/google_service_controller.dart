import 'package:my_app/api/baseUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressSearchModel {
  final String title;
  final String address;
  final String placeId;

  AddressSearchModel(
      {required this.address, required this.title, required this.placeId});

  static List<AddressSearchModel> getAddressPredication(List<dynamic> list) {
    return list.map((item) {
      AddressSearchModel obj = AddressSearchModel(
          title: "",
          address: item['description'] ?? "",
          placeId: item['place_id'] ?? "");
      return obj;
    }).toList();
  }
}

class AddressDetailModel {
  final String title;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postal_code;
  final String district;
  final double lat;
  final double lng;

  AddressDetailModel(
      {required this.title,
      required this.address,
      required this.city,
      required this.state,
      required this.country,
      required this.district,
      required this.postal_code,
      required this.lat,
      required this.lng});

  static AddressDetailModel fromJson(dynamic result, String address) {
    // Helper function to find the long_name of a specific type in address_components
    String getAddressComponent(String type) {
      try {
        return (result['address_components'] as List).firstWhere(
              (component) => (component['types'] as List).contains(type),
              orElse: () => null, // If no match is found
            )?['long_name'] ??
            "";
      } catch (e) {
        return "";
      }
    }

    return AddressDetailModel(
      title: result['name'] ?? "", // Using the name field as title
      address: address,
      city: getAddressComponent("locality") ?? "",
      state: getAddressComponent("administrative_area_level_1") ?? "",
      country: getAddressComponent("country") ?? "",
      district: getAddressComponent("administrative_area_level_2") ?? "",
      postal_code: getAddressComponent("postal_code") ?? "",
      lat: result['geometry']?['location']?['lat'] ?? 0,
      lng: result['geometry']?['location']?['lng'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = title;
    json['address'] = address;
    json['city'] = city;
    json['state'] = state;
    json['country'] = country;
    json['district'] = district;
    json['postal_code'] = postal_code;
    json['lat'] = lat;
    json['lng'] = lng;
    return json;
  }
}

class GoogleServiceController {
  static Future<List<AddressSearchModel>> getAddressList(String value) async {
    const key = ApiUrl.apiKey;
    final URL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$key&components=country:us";
    try {
      final requestHeaders = {
        'Content-Type': "application/json",
      };
      final requestUrl = Uri.parse(URL);
      http.Response res;
      res = await http.get(requestUrl, headers: requestHeaders);
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      return AddressSearchModel.getAddressPredication(jsonData['predictions']);
    } catch (e) {
      print("------error" + e.toString());
      return [];
    }
  }

  static Future<AddressDetailModel> getAddressDetail(
      AddressSearchModel item) async {
    const key = ApiUrl.apiKey;
    final placeId = item.placeId;
    final URL =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    try {
      final requestHeaders = {
        'Content-Type': "application/json",
      };
      final requestUrl = Uri.parse(URL);
      http.Response res;
      res = await http.get(requestUrl, headers: requestHeaders);
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      return AddressDetailModel.fromJson(jsonData['result'], item.address);
    } catch (e) {
      print("------error" + e.toString());
      return AddressDetailModel.fromJson({}, "");
    }
  }
}
