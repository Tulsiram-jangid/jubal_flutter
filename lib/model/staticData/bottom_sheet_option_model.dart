import 'package:my_app/constant/type.dart';

class BottomSheetOptionModel {
  final String title;
  final String type;

  BottomSheetOptionModel({required this.title, required this.type});

  static List<BottomSheetOptionModel> getAddressTypeList() {
    List<BottomSheetOptionModel> list = [];
    list.add(BottomSheetOptionModel(title: "Home", type: FieldTypes.home));
    list.add(BottomSheetOptionModel(title: "Office", type: FieldTypes.office));
    return list;
  }

  static List<BottomSheetOptionModel> getAddressActionList(
      {bool isDefault = false}) {
    List<BottomSheetOptionModel> list = [];
    list.add(BottomSheetOptionModel(title: "Delete", type: FieldTypes.delete));
    if (!isDefault) {
      list.add(BottomSheetOptionModel(
          title: "Make default", type: FieldTypes.makeDefault));
    }
    return list;
  }
}
