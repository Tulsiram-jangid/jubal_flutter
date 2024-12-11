import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/google_service_controller.dart';
import 'package:my_app/screen/activity/my_activity.dart';
import 'package:my_app/screen/event/event_detail_screen.dart';
import 'package:my_app/screen/instrument/instrument_detail.dart';
import 'package:my_app/screen/search/address_search.dart';

class AppNavigation {
  static navigateToEventDetail({BuildContext? context, String? eventId}) {
    if (context != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventDetailScreen(
            eventId: eventId,
          ),
        ),
      );
    }
  }

  static navigateToInstrumentDetail({BuildContext? context, String? instrumentId}) {
    if (context != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InstrumentDetail(
            instrumentId: instrumentId ?? "",
          ),
        ),
      );
    }
  }

  static navigateToAddressSearch({BuildContext? context, required ValueChanged<AddressDetailModel> onSelectAddress}) {
    if (context != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddressSearch(onSelectAddress: onSelectAddress,),
        ),
      );
    }
  }

}
