import 'package:flutter/material.dart';
import 'package:my_app/model/address/address_model.dart';
import 'package:my_app/model/staticData/bottom_sheet_option_model.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/bottomSheet/bottom_sheet_option.dart';

class AddressDetailWidget extends StatelessWidget {
  final String mobile;
  final String email;
  final String fax;
  final String address;
  final String addressType;
  final bool isDefault;

  final ValueChanged<BottomSheetOptionModel> onActionTapped;

  AddressDetailWidget(
      {super.key,
      required this.mobile,
      required this.email,
      required this.address,
      required this.addressType,
      required this.fax,
      required this.onActionTapped,
      this.isDefault = false});

  void onItemPressed(BottomSheetOptionModel item, BuildContext context) {
    Navigator.of(context).pop();
    onActionTapped(item);
  }

  void onAction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (context) {
          return BottomSheetOption(
              list: BottomSheetOptionModel.getAddressActionList(isDefault: isDefault),
              onPressed: (item) {
                onItemPressed(item, context);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              AddressBadge(
                type: addressType,
              ),
              const SizedBox(
                width: 5,
              ),
              if (isDefault) DefaultBadge(),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100], // Light gray background
                  shape: BoxShape.circle, // Makes it circular
                ),
                child: IconButton(
                  onPressed: () {
                    onAction(context);
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          RowText(
            title: "Mobile",
            value: mobile,
          ),
          const SizedBox(
            height: 5,
          ),
          RowText(
            title: "Email",
            value: email,
          ),
          const SizedBox(
            height: 5,
          ),
          RowText(
            title: "Fax",
            value: fax,
          ),
          const SizedBox(
            height: 5,
          ),
          RowText(
            title: "Address",
            value: address,
          )
        ],
      ),
    );
  }
}

class AddressBadge extends StatelessWidget {
  final String type;
  AddressBadge({super.key, required this.type});

  IconData get addressTypeIcon {
    if (type == "office") {
      return Icons.apartment;
    }
    return Icons.home;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(
            addressTypeIcon,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            type,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class DefaultBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: AppColor.green.withOpacity(.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.green.withOpacity(.4), width: 1)),
      child: const Text(
        "Default",
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String title;
  final String value;

  RowText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: "${title} : ",
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(color: AppColor.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
