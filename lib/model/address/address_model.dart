class AddressModel {
  final Map<String, dynamic> address;

  String get mobile {
    int mobile = address['phone'];
    return mobile.toString();
  }
  String get email => address['email'];
  String get id => address['id'];
  String get fax => address['fax'];
  String get type => address['type'];
  bool get isDefault => address['isDefault'];
  String get fullAddress {
    if(address['location'] != null && address['location']['address'] != null){
      return address['location']['address'];
    }
    return "";
  }

  AddressModel({
    required this.address
  });



  static List<AddressModel> getListFromJson(List<dynamic> _list){
    return _list.map((item){
      return AddressModel(address: item);
    }).toList();
  }
  
}