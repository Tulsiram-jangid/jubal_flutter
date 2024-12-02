import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/talent_list_model.dart';
import 'package:my_app/utils/appColor.dart';

class TalentListWidget extends StatelessWidget {
  final TalentListModel talent;

  const TalentListWidget({super.key, required this.talent});

  String getImage() {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.48;
    final imageHeight = imageWidth * 2 * 0.6;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        //width: imageWidth, // Constrain the width of the widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: talent.profilePhoto.isNotEmpty
                  ? Image.network(
                      talent.profilePhoto,
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: imageWidth,
                      height: imageHeight,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(height: 5),
            // Title Text
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    talent.fullName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis, // Prevent overflow for long text
                  ),
                  const SizedBox(height: 3),
                  // Subtitle Text 1
                  Text(
                    talent.getCategory,
                    style: const TextStyle(fontSize: 12, color: AppColor.darkGrey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  // Subtitle Text 2
                  Text(
                    talent.city,
                    style: const TextStyle(fontSize: 12, color: AppColor.darkGrey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
      
  }
}
