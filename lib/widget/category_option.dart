import 'package:flutter/material.dart';
import 'package:my_app/widget/heading_widget.dart';

class CategoryOption extends StatelessWidget {
  final String title;
  final bool? isActive;
  final VoidCallback? onTap;

  const CategoryOption({
    super.key,
    required this.title,
    this.isActive=false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(children: [
          Expanded(flex: 10,child: HeadingWidget(title: title, fontSize: 14,maxLines: 2,)),
          const Spacer(),
          Checkbox(value: isActive, onChanged: (value){},)
        ],),
      ),
    );
  }
  
}