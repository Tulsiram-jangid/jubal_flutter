class RequestResponse {
  bool status = false;
  final Map<String,dynamic>? detail;
  final List<Map<String, dynamic>>? list;
  String message = "";

  RequestResponse({
    required this.status,
    required this.message,
    this.detail,
    this.list
  });
}