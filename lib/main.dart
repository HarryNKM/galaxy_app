import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:galaxy_planets/utils/routes.dart';
import 'package:galaxy_planets/utils/theme_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HomeProvider())],
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          value.changeTheme();
          return    MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: app_routes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: value.isTheme == true ? ThemeMode.light : ThemeMode.dark,
          );
        },

      ),
    ),
  );
}
