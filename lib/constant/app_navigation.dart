import 'package:flutter/material.dart';
import 'package:my_app/screen/event/event_detail_screen.dart';

class AppNavigation {
  static navigateToEventDetail({BuildContext? context, String? eventId}) {
    if (context != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventDetailScreen(eventId: eventId,),
        ),
      );
    }
  }
}
