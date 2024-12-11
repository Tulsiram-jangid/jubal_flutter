class AddressModel {
  final Map<String, dynamic> address;

  String get mobile {
    dynamic mobile = address['phone'];
    return mobile.toString();
  }
  String get email => address['email'];
  String get fax => address['fax'];
  String get type => address['type'];
  bool get isDefault => address['isDefault'];
  String get fullAddress => address['location']['address'] ?? "";

  AddressModel({
    required this.address
  });



  static List<AddressModel> getListFromJson(List<dynamic> _list){
    return _list.map((item){
      return AddressModel(address: item);
    }).toList();
  }
  
}