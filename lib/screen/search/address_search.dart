import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:my_app/api/ApiController/google_service_controller.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/search_text_widget.dart';


class AddressSearch extends StatefulWidget {
  final ValueChanged<AddressDetailModel> onSelectAddress;

  AddressSearch({super.key, required this.onSelectAddress});

  @override
  State<StatefulWidget> createState() {
    return _AddressSearch();
  }
}

class _AddressSearch extends State<AddressSearch> {
  TextEditingController controller = TextEditingController();
  List<AddressSearchModel> list = [];

  void onItemTap(AddressSearchModel item)async {
    final res = await GoogleServiceController.getAddressDetail(item);
    Navigator.of(context).pop();
    widget.onSelectAddress(res);
  }

  void onChanged(String value) async {
    final res = await GoogleServiceController.getAddressList(value);
    setState(() {
      list = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Search Location"),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextField(
              placeholder: "Search location...",
              onChanged: onChanged,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    final item = list[index];
                    return AddressItem(
                      onTap: (){
                        onItemTap(item);
                      },
                      address: item.address,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const Divider();
                  },
                  itemCount: list.length),
            )
          ],
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final String address;
  final VoidCallback? onTap;

  const AddressItem({super.key, this.address = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColor.darkGrey,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: HeadingWidget(
              title: address,
              isText: true,
            ),)
          ],
        ),
      ),
    );
  }
}
