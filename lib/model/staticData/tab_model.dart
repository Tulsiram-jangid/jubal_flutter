import 'package:my_app/constant/type.dart';

class TabModel {
  final String title;
  final String type;

  TabModel({
    required this.title,
    required this.type
  });

  static List<TabModel> getMyLikeTabList(){
    List<TabModel> list = [];
    list.add(TabModel(
      title: "Performance",
      type: FieldTypes.post
    ));
    list.add(TabModel(
      title: "Event",
      type: FieldTypes.event
    ));
    list.add(TabModel(
      title: "Instrument",
      type: FieldTypes.instrument
    ));
    return list;
  }

  static List<TabModel> getJubalStoreTabList(){
    List<TabModel> list = [];
    list.add(TabModel(
      title: "Instrument",
      type: FieldTypes.instrument
    ));
    list.add(TabModel(
      title: "Event",
      type: FieldTypes.event
    ));
    return list;
  }
}