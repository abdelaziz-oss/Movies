import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390,844),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.movietitle,
        debugShowCheckedModeBanner: false,
         theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
        home: const MoviesScreen(),
      ),
    );
  }
}


