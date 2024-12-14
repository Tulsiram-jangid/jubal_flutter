class IdNameModel {
  final String id;
  final String name;

  IdNameModel({
    required this.id,
    required this.name
  });


  static List<IdNameModel> getFromJson(List<dynamic> list, String nameKey){
    return list.map((item){
      return IdNameModel(
        id: item['id'],
        name: item[nameKey]
      );
    }).toList();
  }
}