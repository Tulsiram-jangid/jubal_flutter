import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class AddressDetailWidget extends StatelessWidget {
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
              AddressBadge(),
              const SizedBox(
                width: 5,
              ),
              DefaultBadge(),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100], // Light gray background
                  shape: BoxShape.circle, // Makes it circular
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AddressBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          const Icon(
            Icons.home,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Home",
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
