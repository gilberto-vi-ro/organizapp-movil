import 'package:flutter/material.dart';

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(232, 245, 251, 1)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('myemail'),
              decoration: BoxDecoration(color: Color.fromRGBO(41, 141, 121, 1)),
              currentAccountPicture: RaisedButton(
                  padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 0,
                  color: Color.fromRGBO(41, 141, 121, 1),
                  child: Image.asset(
                    'assets/user-camera2.jpg',
                    // height: 100.0,
                    // width: sss150.0,
                  ),
                  onPressed: () {}),
              accountName: Text(
                'Cresencio diaz hernandez',
                style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
              ),
            ),

            // hacemos la lista de menus
            //  -----------------------------------------------------
            // ListTile(
            //     title: Text('Principal'),
            //     leading:
            //         Icon(Icons.home, color: Color.fromRGBO(41, 141, 121, 1)),
            //     onTap: () =>
            //         Navigator.pushReplacementNamed(context, "Actividades")),

            ListTile(
              title: Text('Actividades'),
              leading: Image.asset(
                'assets/task.png',
                height: 28.0,
              ),
              onTap: () {
                Navigator.restorablePushReplacementNamed(
                    context, "actividades");
                // Navigator.pushReplacementNamed(context, "actividades");
              },
            ),

            ListTile(
              title: Text('Carpetas'),
              leading:
                  Icon(Icons.folder, color: Color.fromRGBO(41, 141, 121, 1)),
              onTap: () {
                Navigator.restorablePushReplacementNamed(context, "carpetas");
              },
            ),

            ListTile(
              title: Text(
                'Editar Perfil',
              ),
              leading: Icon(Icons.edit, color: Color.fromRGBO(41, 141, 121, 1)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "editarPerfil");
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              leading: Icon(Icons.exit_to_app,
                  color: Color.fromRGBO(41, 141, 121, 1)),
              onTap: () {
                Navigator.restorablePushReplacementNamed(context, "login");
                // Navigator.pushReplacementNamed(context, "actividades");
              },
            )
          ],
        )),
  );
}

Widget myShowDialog(msgTitle, msgContent, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext buildcontext) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(232, 245, 251, 1),
          title: Text(
            msgTitle,
            style: TextStyle(color: Color.fromRGBO(41, 141, 122, 1)),
          ),
          content: Text(msgContent, style: TextStyle(color: Colors.red)),
          actions: <Widget>[
            RaisedButton(
              color: Color.fromRGBO(41, 141, 122, 1),
              child: Text(
                "CERRAR",
                style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
