import 'package:flutter/material.dart';
import 'package:organizapp/view/DrawerM.dart';
import 'package:organizapp/view/actividades.dart';
import 'package:organizapp/view/carpetas.dart';
import 'package:organizapp/view/editarPerfil.dart';
import 'package:organizapp/view/login.dart';
import 'package:organizapp/view/pruev.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'login': (BuildContext context) => Login(),
        'DrawerM': (BuildContext context) => DrawerM(),
        'editarPerfil': (BuildContext context) => EditarPerfil(),
        'carpetas': (BuildContext context) => Carpetas(),
        'pruev': (BuildContext context) => MyAps(),
      },
      initialRoute: 'DrawerM',
      theme: ThemeData(primaryColor: Color.fromRGBO(41, 141, 122, 1)),
    );
  }
}
