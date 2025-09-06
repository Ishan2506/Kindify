// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kindify_app/views/login/login_screen.dart';
// import 'token_storage.dart';

// class ApiClient {
//   static const String baseUrl = "https://yourapi.com"; // 🔹 Replace with your API

//   // ✅ Common request handler
//   static Future<http.Response> _request(
//     BuildContext context,
//     Future<http.Response> Function(Map<String, String> headers) requestFn,
//   ) async {
//     String? token = await TokenStorageService.getToken();

//     final headers = {
//       "Content-Type": "application/json",
//       if (token != null) "Authorization": "Bearer $token",
//     };

//     final response = await requestFn(headers);

//     // 🔹 Handle unauthorized (token expired or missing)
//     if (response.statusCode == 401) {
//       await TokenStorageService.clearToken();
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => LoginScreen()),
//         (route) => false,
//       );
//     }

//     return response;
//   }

//   // ✅ GET
//   static Future<http.Response> get(BuildContext context, String endpoint) async {
//     return _request(context, (headers) => http.get(Uri.parse("$baseUrl$endpoint"), headers: headers));
//   }

//   // ✅ POST
//   static Future<http.Response> post(BuildContext context, String endpoint, {Map<String, dynamic>? body}) async {
//     return _request(context, (headers) => http.post(
//           Uri.parse("$baseUrl$endpoint"),
//           headers: headers,
//           body: jsonEncode(body),
//         ));
//   }

//   // ✅ PUT
//   static Future<http.Response> put(BuildContext context, String endpoint, {Map<String, dynamic>? body}) async {
//     return _request(context, (headers) => http.put(
//           Uri.parse("$baseUrl$endpoint"),
//           headers: headers,
//           body: jsonEncode(body),
//         ));
//   }

//   // ✅ DELETE
//   static Future<http.Response> delete(BuildContext context, String endpoint) async {
//     return _request(context, (headers) => http.delete(Uri.parse("$baseUrl$endpoint"), headers: headers));
//   }
// }



import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/token_storage.dart';

class ApiClientService {
  final String baseUrl = "https://kindify-backend.onrender.com";

  /// GET
  Future<http.Response> get(String endpoint, {Map<String, String>? params}) async {
    final token = await TokenStorageService.getToken();
    final uri = Uri.parse("$baseUrl$endpoint").replace(queryParameters: params);

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
    debugPrint("Get header:- ${headers}");
    return await http.get(uri, headers: headers);
  }

  /// POST
  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final token = await TokenStorageService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    return await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  /// PUT
  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    final token = await TokenStorageService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    return await http.put(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  /// DELETE
  Future<http.Response> delete(String endpoint) async {
    final token = await TokenStorageService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    return await http.delete(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
    );
  }
}
