import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widget/BackButtonWidget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? backTap;
  final bool isHaveBackButton;

  AppBarWidget({
    super.key,
    required this.title,
    this.backTap,
    this.isHaveBackButton = true
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: false,
      title: Text(title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
      leading: isHaveBackButton ? BackButtonWidget(backTap: isHaveBackButton ? backTap : (){},) : null,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

}