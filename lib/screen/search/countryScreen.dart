import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:my_app/widget/CustomTextField.dart';
import 'package:my_app/widget/SeachTextField.dart';

class CountryScreen extends StatefulWidget {
  final OnSearchComplete? onSearchComplete;
  const CountryScreen({super.key, this.onSearchComplete});

  @override
  State<StatefulWidget> createState() {
    return _CountryScreen();
  }
}

class _CountryScreen extends State<CountryScreen> {
  List<Country> countries = countryList;

  bool isNumber(String str) {
    try {
      num.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  void onChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        countries = countryList;
      });
      return;
    }
    final newList = countryList
        .where((item) => isNumber(value)
            ? item.phoneCode.toLowerCase().contains(value.toLowerCase())
            : item.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {
      countries = newList;
    });
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  void onTap(Country item) {
    if (widget.onSearchComplete != null) {
      widget.onSearchComplete!(item);
    }
    onBackTap();
  }

  @override
  Widget build(BuildContext context) {
    //final countryItems = countries.map((country) => CountryItem(country: country)).toList();

    return Scaffold(
      appBar: AppBarWidget(title: "Search country", backTap: onBackTap,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextField(
              fillColor: Colors.white,
              onChanged: onChanged,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = countries[index];
                  return CountryItem(
                    country: item,
                    onTap: () {
                      onTap(item);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: countries.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  final Country country; // Pass the country object
  final VoidCallback? onTap;
  CountryItem({super.key, required this.country, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(width: 10), // Add spacing between flag and text
            Expanded(
              flex: 10,
              child: Text(
                country.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Text(country.phoneCode)
          ],
        ),
      ),
    );
  }
}
