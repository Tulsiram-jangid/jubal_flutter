import 'package:flutter/cupertino.dart';
import 'package:my_app/utils/appColor.dart';

class TalentListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.48;
    final imageHeight = imageWidth * 2 * 0.6;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Expanded(
        //width: imageWidth, // Ensure the container has a fixed width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 5),
            // Title Text
            Text(
              "Jaction Action",
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Prevent overflow for long text
            ),
            const SizedBox(height: 3),
            // Subtitle Text 1
            Text(
              "Jaction action",
              style: TextStyle(fontSize: 12, color: AppColor.darkGrey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            // Subtitle Text 2
            Text(
              "Wikes Bane",
              style: TextStyle(fontSize: 12, color: AppColor.darkGrey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}