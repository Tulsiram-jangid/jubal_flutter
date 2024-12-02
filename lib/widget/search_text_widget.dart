import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/utils/appColor.dart';

class SearchTextField extends StatelessWidget {
  final String placeholder;
  final bool isFilterActive;
  final bool showFilterIcon;
  final Color fillColor;
  final ValueChanged<String>? onChanged;
  final bool? activity;

  const SearchTextField({
    super.key,
    this.placeholder = "Search...",
    this.isFilterActive = false,
    this.showFilterIcon = false,
    this.fillColor = Colors.transparent,
    this.onChanged,
    this.activity=false,
  });


  Widget? getSuffixIcon(){
    if(activity!){
      return const SizedBox(width: 10,height: 10, child: Padding( padding: EdgeInsets.all(15),child: CircularProgressIndicator(strokeWidth: 2, color: AppColor.primary,)),);
    }
    if(showFilterIcon){
      return SizedBox(
                width: 20,
                height: 20,
                child: Stack(
                  children: [
                    Center(
                      child: IconButton(
                        onPressed: () {
                          // Handle filter button click
                        },
                        icon: SvgPicture.asset('assets/icons/filter.svg'),
                      ),
                    ),
                    // Active Dot
                    const Positioned(
                      top: 9, // Adjust position as needed
                      right: 12,
                      child: CircleAvatar(
                        radius: 6, // Size of the dot
                        backgroundColor: Colors.green, // Dot color
                      ),
                    ),
                  ],
                ),
              );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: placeholder,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.5),
        ),
        prefixIcon: SizedBox(
          width: 20,
          height: 20,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search.svg')),
        ),
        suffixIcon: getSuffixIcon(),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: Colors.green.withOpacity(1), width: 1.5),
        ),
      ),
    );
  }
}
