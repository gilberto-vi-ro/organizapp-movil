// import 'package:flutter/material.dart';
// import 'agregarBar.dart';
// import 'editarBar.dart';

// class Actividades extends StatefulWidget {
//   const Actividades({Key key}) : super(key: key);

//   @override
//   _ActividadesState createState() => _ActividadesState();
// }

// class _ActividadesState extends State<Actividades> {
//   // bariable de seleccion de la barra inferior
//   // --------------------------------------------------
//   int _paginaActual = 0;
//   List<Widget> _paginas = [PaginaEditBar()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OrganizApp'),
//         centerTitle: true,
//         actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
//       ),
//       body: _paginas[_paginaActual],

//       // ponemos el drawer en esta pantalla de perfil par tener el menu en esta pagina
//       //---------------------------------------------
//       backgroundColor: Color.fromRGBO(232, 245, 251, 1),
//       drawer: Drawer(
//           child: Container(
//               decoration:
//                   BoxDecoration(color: Color.fromRGBO(232, 245, 251, 1)),
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: <Widget>[
//                   UserAccountsDrawerHeader(
//                     decoration:
//                         BoxDecoration(color: Color.fromRGBO(41, 141, 121, 1)),
//                     currentAccountPicture: RaisedButton(
//                         padding: EdgeInsets.only(top: 0, left: 0, right: 0),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50.0)),
//                         elevation: 0,
//                         color: Color.fromRGBO(41, 141, 121, 1),
//                         child: Image.asset('assets/user-camera2.jpg'),
//                         onPressed: () {}),
//                     accountName: Text(
//                       'Cresencio diaz hernandez',
//                       style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
//                     ),
//                   ),

//                   // hacemos la lista de menus
//                   //  -----------------------------------------------------
//                   ListTile(
//                       title: Text('Principal'),
//                       leading: Icon(Icons.home,
//                           color: Color.fromRGBO(41, 141, 121, 1)),
//                       onTap: () =>
//                           Navigator.pushReplacementNamed(context, "DrawerM")),

//                   ListTile(
//                     title: Text('Actividades'),
//                     leading: Image.asset(
//                       'assets/task.png',
//                       height: 28.0,
//                       color: Color.fromRGBO(41, 141, 121, 1),
//                     ),
//                     onTap: () => Navigator.restorablePushReplacementNamed(
//                         context, "actividades"),
//                   ),

//                   ListTile(
//                     title: Text('Carpetas'),
//                     leading: Icon(Icons.folder,
//                         color: Color.fromRGBO(41, 141, 121, 1)),
//                     onLongPress: () {},
//                   ),

//                   ListTile(
//                     title: Text(
//                       'Editar Perfil',
//                       style: TextStyle(color: Color.fromRGBO(59, 56, 56, 1)),
//                     ),
//                     leading: Icon(Icons.edit,
//                         color: Color.fromRGBO(41, 141, 121, 1)),
//                     onTap: () {
//                       Navigator.pushReplacementNamed(context, "editarPerfil");
//                     },
//                   ),
//                   ListTile(
//                     title: Text('Serrar Secion'),
//                     leading: Icon(Icons.exit_to_app,
//                         color: Color.fromRGBO(41, 141, 121, 1)),
//                     onLongPress: () {},
//                   )
//                 ],
//               ))),
//     );
//   }
// }
