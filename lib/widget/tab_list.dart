import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/tab_model.dart';
import 'package:my_app/utils/appColor.dart';

class TabList extends StatelessWidget {
  final List<TabModel> list;
  final TabModel? selectedTab;
  final ValueChanged<TabModel> onTapItem;

  TabList({
    super.key,
    required this.list,
    this.selectedTab,
    required this.onTapItem
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: double.infinity,
      child: Expanded(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            final item = list[index];
            return TabButton(
              isSelected: selectedTab != null ? item.type == selectedTab!.type : false,
              title: item.title,
              onTap: (){
                onTapItem(item);
              },
            );
        }, separatorBuilder: (context,index){
          return const SizedBox(width: 10,);
        }, itemCount: list.length),
      ),
    );
  }
}


class TabButton extends StatelessWidget {

  final bool isSelected;
  final String title;
  final VoidCallback? onTap;

  const TabButton({
    super.key,
    this.isSelected = false,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title, style: TextStyle(color: isSelected ? Colors.white : AppColor.darkGrey, fontWeight: FontWeight.bold)),
      ),
    );
  }
  
}