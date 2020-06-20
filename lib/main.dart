import 'package:flutter/material.dart';
import 'package:foodwango/job_description.dart';
import 'homescreen.dart';
import 'job_description.dart';
import 'company_details.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>homescreen(),
        '/second':(context)=>jobdescription(),
        '/third':(context)=>companydetails(),
      },
      title:'recr  uiter',


      debugShowCheckedModeBanner: false,
      
     // home:homescreen(),
    );
  }
}