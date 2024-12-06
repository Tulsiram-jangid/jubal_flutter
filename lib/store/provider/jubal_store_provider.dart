import 'package:flutter/material.dart';

class JubalStoreProvider extends ChangeNotifier {
  //For jubal Store events
  List<dynamic> eventList = [];
  int eventPage = 1;
  int eventTotalPage = 1;

  //For jubal Store instruments
  List<dynamic> instrumentList = [];
  int instrumentPage = 1;
  int instrumentTotalPage = 1;

  void setEventList({
    List<dynamic>? list,
    int? page,
    int? totalPage
  }){
    if(list!.isNotEmpty){
      this.eventList = list;
      this.eventPage = page ?? this.eventPage;
      this.eventTotalPage = totalPage ?? this.eventTotalPage;
    }
  }

  void setInstrumentList({
    List<dynamic>? list,
    int? page,
    int? totalPage
  }){
    if(list!.isNotEmpty){
      this.instrumentList = list;
      this.instrumentPage = page ?? this.instrumentPage;
      this.instrumentTotalPage = totalPage ?? this.instrumentTotalPage;
    }
  }
}