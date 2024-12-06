import 'package:my_app/api/api_form.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class InstrumentServiceController {
  static Future<ApiResponse> getJubalStoreInstrumentList({int? page = 1}) async {
    final body = ApiForm.getJubalStoreForm(page: page);
    const URL = ApiUrl.instrumentList;
    return await ApiRequest.request(url: URL, method: "POST", body: body);
  }
}
