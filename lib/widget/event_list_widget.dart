import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class EventListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imgHeight = 150.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=',
                width: double.infinity,
                height: imgHeight,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text(
                          "Concerts: Live performances by artists or bands, often in large venues or stadiums.", style: TextStyle(fontWeight: FontWeight.bold),)),
                          const SizedBox(width: 10,),
                          Text("\$39", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text("Live and Cracko", style: TextStyle(color: AppColor.darkGrey),),
                  const SizedBox(height: 6,),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Icon(Icons.location_on, color: AppColor.darkGrey,),
                    Expanded(child: Text("The Airstream Main Courtyards, Paintworks The Airstream Main Courtyards, Paintworks", style: TextStyle(color: AppColor.darkGrey),maxLines: 2,)),
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
