import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/menu_model.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/heading_widget.dart';

class MenuScreen extends StatelessWidget {
  final List<MenuModel> menus = MenuModel.getMenuList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final item = menus[index];
                  return MenuItem(
                    menu: item,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: menus.length),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final MenuModel menu;

  const MenuItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300),
            child: menu.icon != null
                ? IconButton(
                    icon: menu.icon!,
                    onPressed: () {},
                  )
                : null,
          ),
          const SizedBox(
            width: 10,
          ),
          HeadingWidget(
            title: menu.title,
            fontSize: 14,
            color: AppColor.darkGrey,
          ),
          const Spacer(),
          menu.badge != null && menu.badge! > 0
              ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primary),
                    //padding: EdgeInsets.all(10),
                    child: Text(menu.badge.toString(), style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
              )
              : const Icon(
                  Icons.chevron_right,
                  color: AppColor.darkGrey,
                  size: 30,
                )
        ],
      ),
    );
  }
}
