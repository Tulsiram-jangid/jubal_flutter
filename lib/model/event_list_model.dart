import 'dart:convert';

import 'package:my_app/constant/type.dart';
import 'package:intl/intl.dart';

class EventListModel {
  final Map<String, dynamic> event;

  EventListModel({required this.event});

  // Basic fields
  String get id => event['id'] ?? '';
  String get eventName => event['eventName'] ?? '';
  String get eventDescription => event['eventDescription'] ?? '';
  String get eventImage => event['eventImage'] ?? '';
  int get eventStatus => event['eventStatus'] ?? 0;
  String get eventStatusText {
    return getEventStatusText(eventStatus.toString()) ?? "";
  }

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

  String get getFormattedDate {
    String startDate = event['eventTimeLocation']['start_date'];
    String startTime = event['eventTimeLocation']['start_time'];
    String endDate = event['eventTimeLocation']['end_date'];
    String endTime = event['eventTimeLocation']['end_time'];

    // Combine the date and time to create DateTime objects
    String startDateTimeStr = "$startDate $startTime";
    String endDateTimeStr = "$endDate $endTime";

    // Define the format used in the input data
    DateFormat inputFormat = DateFormat("dd-MM-yyyy hh:mm a");

    // Parse the strings into DateTime objects
    DateTime startDateTime = inputFormat.parse(startDateTimeStr);
    DateTime endDateTime = inputFormat.parse(endDateTimeStr);

    // Define the desired output format
    DateFormat outputFormat = DateFormat("MMMM dd, yy hh:mm a");

    // Format the DateTime objects to the desired format
    String formattedStart = outputFormat.format(startDateTime);
    String formattedEnd = DateFormat("hh:mm a").format(endDateTime);

    // Combine the start and end times in the requested format
    String formattedEventTime = "$formattedStart to $formattedEnd";
    return formattedEventTime;
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

  // Nested Talent object inside User
  Map<String, dynamic> get userTalent => user['Talent'] ?? {};
  String get talentId => userTalent['id'] ?? '';
  bool get profileVerified => userTalent['profileVerified'] ?? false;

  List<String> get talentCategory {
    if (userTalent['catagory'] != null) {
      String categories = userTalent['catagory'] ?? '';
      return categories.isNotEmpty
          ? List<String>.from(jsonDecode(categories) as List<dynamic>)
          : [];
    }
    return [];
  }

  List<String> get talentInstruments {
    if (userTalent['instrument'] != null) {
      String instruments = userTalent['instrument'] ?? '';
      return instruments.isNotEmpty
          ? List<String>.from(jsonDecode(instruments) as List<dynamic>)
          : [];
    }
    return [];
  }

  List<String> get talentGenres {
    if (userTalent['genre'] != null) {
      String genres = userTalent['genre'] ?? '';
      return genres.isNotEmpty
          ? List<String>.from(jsonDecode(genres) as List<dynamic>)
          : [];
    }
    return [];
  }

  List<Map<String, dynamic>> get talentSocialUrls {
    if (userTalent['socialurls'] != null) {
      String socialUrls = userTalent['socialurls'] ?? '';
      return socialUrls.isNotEmpty
          ? List<Map<String, dynamic>>.from(
              jsonDecode(socialUrls) as List<dynamic>)
          : [];
    }
    return [];
  }

  // Nested Vendor object inside User
  Map<String, dynamic> get vendor => user['Vendor'] ?? {};
  String get vendorId => vendor['id'] ?? '';
  List<String> get vendorServices {
    if (vendor['services'] != null) {
      String services = vendor['services'] ?? '';
      return services.isNotEmpty
          ? List<String>.from(jsonDecode(services) as List<dynamic>)
          : [];
    }
    return [];
  }

  List<Map<String, dynamic>> get vendorSocialUrls {
    if (vendor['socialurls'] != null) {
      String socialUrls = vendor['socialurls'] ?? '';
      return socialUrls.isNotEmpty
          ? List<Map<String, dynamic>>.from(
              jsonDecode(socialUrls) as List<dynamic>)
          : [];
    }
    return [];
  }
}
