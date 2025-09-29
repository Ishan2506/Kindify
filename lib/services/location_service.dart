// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class LocationService {
//   static const String baseUrl = "https://countriesnow.space/api/v0.1/countries";

//     static Future<List<String>> fetchStates() async {
//     final response = await http.get(
//       Uri.parse("$baseUrl/states/q?country=India"),
//     );
//     debugPrint(response.statusCode.toString());
//     debugPrint(response.body);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return List<String>.from(data["data"]["states"].map((s) => s["name"]));
//     } else {
//       throw Exception("Failed to fetch states");
//     }
//   }

//   /// Fetch all states and cities in India
//   static Future<List<Map<String, String>>> fetchAllCitiesWithStates() async {
//     final statesResponse = await http.get(
//       Uri.parse("$baseUrl/states/q?country=India"),
//     );

//     if (statesResponse.statusCode != 200) {
//       throw Exception("Failed to fetch states");
//     }

//     final statesData = jsonDecode(statesResponse.body);
//     final states = List<String>.from(statesData["data"]["states"].map((s) => s["name"]));

//     List<Map<String, String>> cityStateList = [];

//     // Fetch cities for each state
//     for (String state in states) {
//       final citiesResponse = await http.get(
//         Uri.parse("$baseUrl/state/cities/q?country=India&state=$state"),
//       );

//       if (citiesResponse.statusCode == 200) {
//         final citiesData = jsonDecode(citiesResponse.body);
//         final cities = List<String>.from(citiesData["data"]);
//         cityStateList.addAll(cities.map((city) => {"city": city, "state": state}));
//       }
//     }

//     return cityStateList;
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationService {
  static Map<String, List<String>> stateCityMap = {};

  // load the file once
  static Future<void> loadStateCityFile() async {
    String content = await rootBundle.loadString('assets/data/State_City.txt');

    final Map<String, dynamic> data = jsonDecode(content);
    debugPrint(data.toString());
    data.forEach((stateName, cities) {
      stateCityMap[stateName] = List<String>.from(cities);
    });
  }


  // get all states
  static List<String> getStates() {
    return stateCityMap.keys.toList();
  }

  // get cities by state
  static List<String> getCities(String state) {
    return stateCityMap[state] ?? [];
  }

  // get state by city
  static String? getStateByCity(String city) {
    return stateCityMap.entries
        .firstWhere((entry) => entry.value.contains(city), orElse: () => MapEntry("", []))
        .key;
  }
}

