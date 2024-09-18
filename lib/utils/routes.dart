import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/detail/view/detail_screen.dart';
import 'package:galaxy_planets/screen/home/view/home_screen.dart';
import 'package:galaxy_planets/screen/save/view/save_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/':(context)=>const HomeScreen(),
  'detail':(context)=>DetailScreen(),
  'save':(context)=>SaveScreen(),
};