import 'package:flutter/material.dart';
import 'package:my_app/widget/app_bar_widget.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddAddressScreen();
  }
}

class _AddAddressScreen extends State<AddAddressScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: ""),
    );
  }
}