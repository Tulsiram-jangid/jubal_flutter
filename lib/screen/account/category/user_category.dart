import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/account_setting_model.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/option_button.dart';

class UserCategory extends StatelessWidget {
  List<AccountSettingModel> list = AccountSettingModel.getUserCategoryList();

  void onItemTap(BuildContext context, AccountSettingModel item) {
    if (item.routeName.isNotEmpty) {
      Navigator.of(context).pushNamed(item.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Fields of interests"),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          itemBuilder: (_, index) {
            final item = list[index];
            return OptionButton(
              title: item.title,
              onTap: () {
                onItemTap(context, item);
              },
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: list.length),
    );
  }
}
