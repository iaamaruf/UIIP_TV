import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiip_tv/App/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uiip_tv/App/screen/startpage.dart';



void main()  async{
  await Hive.initFlutter();
  await Hive.openBox('postsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}