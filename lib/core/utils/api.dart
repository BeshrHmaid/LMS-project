import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio _dio;
  final String baseUrl = "http://localhost:8080/";

  Api(this._dio);

  // Future<Map<String, dynamic>> get({required String endPoint}) async {
  //   var response = await _dio.get("$baseUrl$endPoint");
  //   return response.data as Map<String, dynamic>;
  // }
  Future<List<dynamic>> get(
      {required String endPoint, @required String? token}) async {
     if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data as List<dynamic>;
  }

  Future<dynamic> post(
      {required String endPoint,
      required dynamic body,
      @required String? token}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    var response = await _dio.post("$baseUrl$endPoint", data: body);
    print("POST response: ${response.data}"); // Log the response

    if (response.data is String) {
      // Return the string message if that's what the response contains
      return response.data;
    }

    // Otherwise, return the JSON map
    return response.data as Map<String, dynamic>;
  }
}

// class Api {
// Future<dynamic> get({required String url, @required String? token}) async {
//   Map<String, String> headers = {};
//   if (token != null) {
//     headers.addAll(
//       {'Authorization': 'Bearer $token'},
//     );
//   }
//   http.Response response = await http.get(Uri.parse(url), headers: headers);
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     throw Exception(
//         'there was an error with the request , status code : ${response.statusCode}');
//   }
// }

// Future<dynamic> post(
//     {required String url,
//     @required dynamic body,
//     @required String? token}) async {
//   Map<String, String> headers = {'Content-Type': 'application/json'};
//   if (token != null) {
//     headers.addAll(
//       {'Authorization': 'Bearer $token'},
//     );
//   }
//   http.Response response =
//       await http.post(Uri.parse(url), body: jsonEncode(body), headers: headers);
//   if (response.statusCode == 200) {
//     try {
//       return jsonDecode(response.body);
//     } catch (e) {
//       // If the response is not a JSON, return it as plain text
//       return response.body;
//     }
//   } else {
//     throw Exception(
//         'there was an error with the request , status code : ${response.statusCode} , body : ${response.body}');
//   }
// }

// Future<dynamic> put(
//     {required String url,
//     @required dynamic body,
//     @required String? token}) async {
//   Map<String, String> headers = {'Content-Type': 'application/json'};
//   if (token != null) {
//     headers.addAll(
//       {'Authorization': 'Bearer $token'},
//     );
//   }
//   http.Response response =
//       await http.put(Uri.parse(url), body: jsonEncode(body), headers: headers);
//   if (response.statusCode == 200) {
//     try {
//       return jsonDecode(response.body);
//     } catch (e) {
//       // If the response is not a JSON, return it as plain text
//       return response.body;
//     }
//   } else {
//     throw Exception(
//         'there was an error with the request , status code : ${response.statusCode} , body : ${response.body}');
//   }
//  }
// final Dio _dio;
//   final String baseUrl="http://localhost:8080/";
//   Api(this._dio);

//   Future<Map<String,dynamic>> get({required String endPoint})async{
//     var response = await _dio.get("$baseUrl$endPoint");
//     return response.data;
//   }
//   Future<Map<String, dynamic>> post({required String endPoint , required Map<String, dynamic> body}) async {
//     var response = await _dio.post("$baseUrl$endPoint", data: body);
//     return response.data;
//   }
// }
