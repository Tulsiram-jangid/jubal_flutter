import 'dart:io';

import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class FileServiceController {
  static Future<bool> uploadFile({
    required File file,
    required String userId,
    String? type,
    String? key,
  })async{
    const url = ApiUrl.uploadFile;
    dynamic fields = {
      "userId": userId,
      "type": type,
    };
    final res = await ApiRequest.request(
      url: url,
      file: file,
      fields: fields,
      fileKey: key,
      method: "POST",
      uploadFile: true
    );
    return res.status;    
  }
}