import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/route/route.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(create: (context)=> StoreProvider(), child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: AppColor.bgColor,
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteNames.splashScreen,
      // darkTheme: ThemeData.dark().copyWith(
      //   primaryColor: Colors.blueGrey,
      //   scaffoldBackgroundColor: Colors.grey.shade800,
      //   cardColor: Colors.red
      //   // Customize dark theme here
      // ),
    );
  }
}
