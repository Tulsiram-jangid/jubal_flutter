class EventDetailModel {
  final Map<String, dynamic> event;

  EventDetailModel({required this.event});

  // Basic fields
  String get id => event['id'] ?? '';
  String get eventName => event['eventName'] ?? '';
  String get eventDescription => event['eventDescription'] ?? '';
  String get eventImage => event['eventImage'] ?? '';
  int get eventStatus => event['eventStatus'] ?? 0;
  String get musicType => event['musicType'] ?? '';
  String get eventType => event['eventType'] ?? '';
  bool get createdByTalent => event['createdByTalent'] ?? false;
  String get visibilityType => event['visibilityType'] ?? '';
  bool get announceEvent => event['announceEvent'] ?? false;
  double get latitude => (event['latitude'] ?? 0).toDouble();
  double get longitude => (event['longitude'] ?? 0).toDouble();
  int get purchasedCount => event['purchasedCount'] ?? 0;
  int get ticketCount => event['ticketCount'] ?? 0;
  int get like => event['like'] ?? 0;
  double get revenue => (event['revenue'] ?? 0).toDouble();

  // Nested objects
  Map<String, dynamic> get tickets => event['tickets'] ?? {};
  String get ticketPrice => tickets['price'] ?? '';
  double get ticketPrice_ {
    if (tickets['price'] != null && (tickets['price'] as String).isNotEmpty) {
      String price =
          (tickets['price'] as String).isNotEmpty ? tickets['price'] : 0;
      return int.parse(price).toDouble();
    }
    return 0;
  }

  String get ticketQuantity => tickets['quantity'] ?? '';

  Map<String, dynamic> get eventTimeLocation =>
      event['eventTimeLocation'] ?? {};
  String get state => eventTimeLocation['state'] ?? '';
  String get startDate => eventTimeLocation['start_date'] ?? '';
  String get startTime => eventTimeLocation['start_time'] ?? '';
  String get endDate => eventTimeLocation['end_date'] ?? '';
  String get endTime => eventTimeLocation['end_time'] ?? '';
  String get location => eventTimeLocation['location'] ?? '';

  Map<String, dynamic> get eventPricing => event['eventPricing'] ?? {};
  String get pricingType => eventPricing['type'] ?? '';

  // Nested User object
  Map<String, dynamic> get user => event['User'] ?? {};
  String get userId => user['id'] ?? '';
  String get username => user['username'] ?? '';
  String get firstName => user['firstName'] ?? '';
  String get lastName => user['lastName'] ?? '';
  String get fullName => "${firstName.trim()} ${lastName.trim()}".trim();
  String get profilePhoto => user['profilePhoto'] ?? '';
  String get profileBanner => user['profileBanner'] ?? '';
  int get userType => user['type'] ?? 0;
}
