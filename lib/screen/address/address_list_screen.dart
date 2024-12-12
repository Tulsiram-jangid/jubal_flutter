import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/address_service_controller.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/model/address/address_model.dart';
import 'package:my_app/model/staticData/bottom_sheet_option_model.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/widget/add_action_widget.dart';
import 'package:my_app/widget/address_detail_widget.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/add_action_widget.dart';

class AddListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddListScreen();
  }
}


class _AddListScreen extends State<AddListScreen>{
  bool activity = false;
  List<AddressModel> list = [];

  void initState(){
    super.initState();
    getAddress();
  }

  void getAddress()async{
    setState(() {
      activity = true;
    });
    final res = await AddressServiceController.getAddress();
    List<dynamic> _list = res.data;
    setState(() {
      activity = false;
      list = AddressModel.getListFromJson(_list);
    });
  }

  void onAddPressed(){
    AppNavigation.navigateToAddAddress(context: context, onRefresh: (){
      getAddress();
    });
  }

  void deleteAddress(String addressId)async{
    setState(() {
      activity = true;
    });
    final res = await AddressServiceController.deleteAddress(addressId: addressId);
    if(res.status){
      getAddress();
      return;
    }
    setState(() {
      activity = false;
    });
  }

  void makeDefault(String addressId)async{
    setState(() {
      activity = true;
    });
    final form = {
      "isDefault": true
    };
    final res = await AddressServiceController.editAddress(addressId: addressId, body: form);
    if(res.status){
      getAddress();
      return;
    }
    setState(() {
      activity = false;
    });
  }

  void onActionTapped(BottomSheetOptionModel item, AddressModel address)async{
    if(item.type == FieldTypes.delete){
      deleteAddress(address.id);
      return;
    }
    if(item.type == FieldTypes.makeDefault){
      makeDefault(address.id);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Address",
      actions: [
        AddActionWidget(onPressed: onAddPressed,)
      ],),
      body:  Padding(
        padding: const EdgeInsets.all(10),
        child: activity ? ListShimmer(height: 100,) : Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          HeadingWidget(title: "Address"),
          const SizedBox(height: 5,),
          HeadingWidget(title: "Add common address that you want to use for collection or delivery here.", isText: true,),
          const SizedBox(height: 10,),
          Expanded(child: ListView.separated(itemBuilder: (_,index){
            final item = list[index];
            return AddressDetailWidget(
              mobile: item.mobile,
              email: item.email,
              address: item.fullAddress,
              isDefault: item.isDefault,
              fax: item.fax,
              addressType: item.type,
              onActionTapped: (_item){
                onActionTapped(_item,item);
              },
            );
          }, separatorBuilder: (_,index){
            return const SizedBox(height: 10,);
          }, itemCount: list.length))
        ],),),
      ),
    );
  }
}
