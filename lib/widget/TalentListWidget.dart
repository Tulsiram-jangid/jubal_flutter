import 'package:flutter/cupertino.dart';
import 'package:my_app/utils/appColor.dart';

class TalentListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * .48;
    final imageHeight = imageWidth * 2 * .6;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5,),
            Text("Jaction action", style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 3,),
            Text("Jaction action", style: TextStyle(fontSize: 12, color: AppColor.darkGrey),),
            const SizedBox(height: 3,),
            Text("Wikes Bane", style: TextStyle(fontSize: 12, color: AppColor.darkGrey),),
          ],
        ),
      ),
    );
  }
}
