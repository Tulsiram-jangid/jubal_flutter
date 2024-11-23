import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRequest {
  // A common function to handle all HTTP requests
  static Future<dynamic> request({
    required String url,
    String method = 'GET', // Default to 'GET' method
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      // Default headers for the request
      final requestHeaders = headers ?? {'Content-Type': "application/json"};
      final requestUrl = Uri.parse(url);
      
      http.Response res;

      // Handle different HTTP methods
      switch (method.toUpperCase()) {
        case 'POST':
          res = await http.post(requestUrl, headers: requestHeaders, body: jsonEncode(body));
          break;
        case 'PUT':
          res = await http.put(requestUrl, headers: requestHeaders, body: jsonEncode(body));
          break;
        case 'DELETE':
          res = await http.delete(requestUrl, headers: requestHeaders);
          break;
        case 'GET':
        default:
          res = await http.get(requestUrl, headers: requestHeaders);
          break;
      }

      // Check response status and return the data if successful
      return jsonDecode(res.body);
      
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }
}
