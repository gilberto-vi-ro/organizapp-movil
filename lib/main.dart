import 'package:flutter/material.dart';
import 'package:organizapp/view/Actividades.dart';
import 'package:organizapp/view/Carpetas.dart';
import 'package:organizapp/view/EditarPerfil.dart';
import 'package:organizapp/view/Login.dart';
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
        'actividades': (BuildContext context) => Actividades(),
        'editarPerfil': (BuildContext context) => EditarPerfil(),
        'carpetas': (BuildContext context) => Carpetas(),
        'pruev': (BuildContext context) => MyAps(),
      },
      initialRoute: 'actividades',
      theme: ThemeData(primaryColor: Color.fromRGBO(41, 141, 122, 1)),
    );
  }
}
