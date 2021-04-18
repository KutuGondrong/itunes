import 'package:flutter/material.dart';
import 'package:itunes/pages/home_page.dart';

import '../route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Gondrong',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.home,
      onGenerateRoute: (settings){
        switch (settings.name) {
          case RouteNames.home: {
            return createRouteAnimation(HomePage());
          }
          default: {
            assert(false, 'Need to implement ${settings.name}');
            return null;
          }
        }
      },
    );
  }
}
