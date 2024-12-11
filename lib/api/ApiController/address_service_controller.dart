import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class AddressServiceController {
  static Future<ApiResponse> addNewAddress({
    final body
  })async {
    const URL = ApiUrl.createAddress;
    return await ApiRequest.request(url: URL, body: body, method: "POST");
  }

  static Future<ApiResponse> editAddress({
    String addressId = "", 
    final body
  })async {
    final URL = "${ApiUrl.editAddress}/$addressId";
    return await ApiRequest.request(url: URL, body: body, method: "POST");
  }

  static Future<ApiResponse> getAddress()async {
    const URL = "${ApiUrl.getAddressList}";
    return await ApiRequest.request(url: URL, method: "GET");
  }

  static Future<ApiResponse> deleteAddress({
    String addressId = "",
  })async {
    final URL = "${ApiUrl.deleteAddress}/$addressId";
    return await ApiRequest.request(url: URL, method: "GET");
  }
}