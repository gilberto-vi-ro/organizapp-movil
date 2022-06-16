import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:organizapp/view/editarPerfil.dart';
import 'include/agregarBar.dart';
import 'include/editarBar.dart';
import 'include/entregadoTab.dart';
import 'include/pendienteTab.dart';
import 'include/listoTab.dart';

class Carp1 extends StatefulWidget {
  const Carp1({Key key}) : super(key: key);

  @override
  _Carp1State createState() => _Carp1State();
}

class _Carp1State extends State<Carp1> {
  // array de los tabBart
  // -------------------------------------------
  @override
  Widget build(BuildContext context) {
    Scaffold(
      // comienza en menu amburgesa (drawer)
      // ----------------------------------------------
      drawer: Drawer(
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(232, 245, 251, 1)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(41, 141, 121, 1)),
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
                ListTile(
                    title: Text('Principal'),
                    leading: Icon(Icons.home,
                        color: Color.fromRGBO(41, 141, 121, 1)),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "DrawerM")),

                ListTile(
                  title: Text('Actividades'),
                  leading: Image.asset(
                    'assets/task.png',
                    height: 28.0,
                  ),
                  onTap: () {
                    Navigator.restorablePushReplacementNamed(
                        context, "DrawerM");
                    // Navigator.pushReplacementNamed(context, "actividades");
                  },
                ),

                ListTile(
                  title: Text('Carpetas'),
                  leading: Icon(Icons.folder,
                      color: Color.fromRGBO(41, 141, 121, 1)),
                  onTap: () {
                    Navigator.restorablePushReplacementNamed(
                        context, "carpetas");
                  },
                ),

                ListTile(
                  title: Text(
                    'Editar Perfil',
                  ),
                  leading:
                      Icon(Icons.edit, color: Color.fromRGBO(41, 141, 121, 1)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "editarPerfil");
                  },
                ),
                ListTile(
                  title: Text('Serrar Secion'),
                  leading: Icon(Icons.exit_to_app,
                      color: Color.fromRGBO(41, 141, 121, 1)),
                  onLongPress: () {},
                )
              ],
            )),
      ),

      // asemos los tabs dentro de un appBar
      // --------------------------------------
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 141, 122, 1),
        centerTitle: true,
        title: Text('OrganizApp',
            style: TextStyle(
                color: Color.fromRGBO(
              232,
              245,
              251,
              1,
            ))),
        bottom: new TabBar(
            unselectedLabelColor: Color.fromRGBO(59, 56, 56, 1),
            indicatorColor: Color.fromRGBO(41, 141, 122, 1),
            tabs: <Widget>[
              new Tab(
                // icon: new Icon(Icons.home),
                text: 'Pendiente',

                // color: red,
              ),
              new Tab(
                // icon: new Icon(Icons.person),
                text: 'Listo',
              ),
              new Tab(
                // icon: new Icon(Icons.book),
                text: 'Entregado',
              ),
            ]),
      ),

      // body: _paginas[_paginaActual],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(59, 56, 56, 1),
        // unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
        selectedItemColor: Color.fromRGBO(41, 141, 122, 1),
        unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(41, 141, 122, 1)),
        onTap: (index) {
          if (index == 3) {
            print("hola mundo");
          } else if (index == 4) {
            print("hola mundo");
          } else {
            setState(() {});
          }
        },
        // ponemos la barrra de navegador de abajo
        // el bottomnavigator------------------------
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.picture_as_pdf_rounded,
            ),
            label: "Actividades",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
            ),
            label: "Agregar",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
              ),
              label: "Editar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.delete,
              ),
              label: "Eliminar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.loop_outlined), label: "Cargar")
        ],
      ),
    );
  }
}
