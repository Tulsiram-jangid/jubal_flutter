import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/api/ApiController/category_service_controller.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/id_name_model.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/category_option.dart';
import 'package:my_app/widget/search_text_widget.dart';
import 'package:provider/provider.dart';

class PrimaryCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrimaryCategory();
}

class _PrimaryCategory extends State<PrimaryCategory> {
  List<IdNameModel> list = [];
  List<IdNameModel> selectedList = [];
  bool isListUpdated = false;

  bool activity = false;
  bool saveActivity = false;

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future<void> getList() async {
    try {
      // Safely access StoreProvider and check nulls
      final storeProvider = Provider.of<StoreProvider>(context, listen: false);
      List<String> userServices = storeProvider.user!.category;

      if (storeProvider.user?.service == null) {
        print("User or services are null");
        return;
      }

      setState(() {
        activity = true;
      });

      // Fetch the list of services
      final List<IdNameModel> itemList =
          await CategoryServiceController.getPrimaryCategory();

      // Filter the services based on the user's selected services
      List<IdNameModel> userSelectedService =
          itemList.where((item) => userServices.contains(item.name)).toList();

      // Update state with the new data
      setState(() {
        activity = false;
        list = itemList;
        selectedList = userSelectedService;
      });
    } catch (e, stackTrace) {
      setState(() {
        activity = false;
      });
      print("Error in getList: $e");
      print(stackTrace);
    }
  }

  bool isItemSelected(IdNameModel item) {
    return selectedList.any((_item) => item.id == _item.id);
  }

  void onItemTap(IdNameModel item) {
    if (isItemSelected(item)) {
      setState(() {
        selectedList =
            selectedList.where((_item) => _item.id != item.id).toList();
        isListUpdated = true;
      });
      return;
    }
    setState(() {
      selectedList.add(item);
      isListUpdated = true;
    });
  }

  void onSearch(String value) async {
    if (value.isEmpty) {
      getList();
      return;
    }
    if (value.length > 2) {
      setState(() {
        activity = true;
      });
      final List<IdNameModel> itemList =
          await CategoryServiceController.getPrimaryCategory(search: value);
      setState(() {
        activity = false;
        list = itemList;
      });
    }
  }

  void onSubmit() async {
    dynamic form = {
      "catagory": jsonEncode(selectedList.map((item) => item.name).toList())
    };
    setState(() {
      saveActivity = true;
    });
    final res = await AuthServiceController.updateUserProfile(body: form);
    setState(() {
      saveActivity = false;
    });
    if (res) {
      Helper.showToast(context, "Services updated successfully");
      AppNavigation.pop(context);
    }
  }

  Widget get renderList {
    if (activity) {
      return ListShimmer(height: 50); // Remove Expanded
    }
    return ListView.separated(
        itemBuilder: (_, index) {
          final item = list[index];
          return CategoryOption(
            title: item.name,
            isActive: isItemSelected(item),
            onTap: () {
              onItemTap(item);
            },
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: list.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Primary category"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              placeholder: "Search primary category...",
              onChanged: onSearch,
            ),
            const SizedBox(height: 20),
            // Avoid Expanded inside a Column in a scrollable view
            Flexible(
              child: renderList,
            ),

            SafeArea(
              child: AppButton(
                onTap: onSubmit,
                title: "Save",
                disabled: !isListUpdated,
                isLoading: saveActivity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
