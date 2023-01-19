
import 'package:browser/Screens/AppShowScreen/view/AppShowPage.dart';
import 'package:browser/Screens/BottomScreen/Provider/BottomProvider.dart';
import 'package:browser/Screens/BottomScreen/View/BottomPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => BottomProvider(),)
     ],
     child: Sizer(
       builder: (context, orientation, deviceType) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           routes: {
             '/' : (context) => BottomPage(),
             'Appshow' : (context) => AppShowPage(),
           },
         );
       },
     ),
   )
  );
}