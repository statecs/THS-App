import 'package:flutter/material.dart';
import 'package:hawalnir1/src/view_models/app_key.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(builder: (_) => Keys()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // adding a theme

        brightness: Brightness.dark, //changing the theme to dark
        primaryColor: Colors.black,
        accentColor: Colors.black,

        fontFamily: 'NotoSansArabic',
        tabBarTheme: TabBarTheme(),
        iconTheme: IconThemeData(),
      ),
      home: HawalnirHome(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{},
    ),
  ));
}
