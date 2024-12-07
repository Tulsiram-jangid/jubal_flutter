import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widget/back_button_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? backTap;
  final bool isHaveBackButton;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    required this.title,
    this.backTap,
    this.isHaveBackButton = true,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isHaveBackButton,
      centerTitle: false,
      title: Text(title, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),maxLines: 2,),
      leading: isHaveBackButton ? BackButtonWidget(backTap: isHaveBackButton ? backTap : (){},) : null,
      actions: actions,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

}