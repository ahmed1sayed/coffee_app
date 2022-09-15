import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:for_jop/cach_helper.dart';
import 'package:for_jop/pages/home_page.dart';
 import 'package:for_jop/pages/onboarding_screen.dart';


 //=======default colors====================
const Color defaultColor=  Color(0xFF9B482C);
const Color backColor=Color(0xFF06658D);

//===========main method===================

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    CacheHelper.init();
  bool val=CacheHelper.getData(key: 'onBoarding')??false;
  Widget widget;
  if(val){
    widget = const HomePage();
  }else{
    widget = const OnBoarding();
  }
  runApp(  MyApp(startPage: widget,));

  FlutterNativeSplash.remove();


}

class MyApp extends StatelessWidget {

  Widget startPage;
    MyApp({super.key,required this.startPage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter coffee',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: startPage,
    );
  }
}
