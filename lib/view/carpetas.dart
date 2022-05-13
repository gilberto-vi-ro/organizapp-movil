import 'package:flutter/material.dart';
import 'package:organizapp/view/DrawerM.dart';
import 'package:organizapp/view/carp1.dart';

import 'agregarBar.dart';
import 'editarBar.dart';

class Carpetas extends StatefulWidget {
  const Carpetas({Key key}) : super(key: key);

  @override
  _CarpetasState createState() => _CarpetasState();
}

class _CarpetasState extends State<Carpetas> {
  // agregamos estas variable para que funcione la
  // barra inferior
// final m = PaginaAgregarBar();

//   int _paginaActual = 0;

//   List<Widget> _paginas = [PaginaAgregarBar(), PaginaEditBar()];

  @override
  Widget build(BuildContext context) {
    // final TabController = new DefaultTabController()
    //     length: 3,
    return Scaffold(
      // ponemos el apBar (barra menu)
      // ----------------------------------------------
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OrganizApp',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),

//  ponemos el drawer en esta pagina
// --------------------------------------------------
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

      // ponemos el scrolvio para el sclol de la ap
      // dentro de este pondremas lo siguinente

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                // Boton de retroceso
                // -----------------
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  color: Color.fromRGBO(41, 141, 122, 1),
                  onPressed: () {},
                ),
                // Barra de path
                // ----------------
                Text(
                  'Carpeta1/Carpeta2/Carpeta3',
                  style: TextStyle(
                      color: Color.fromRGBO(41, 141, 122, 1), fontSize: 15),
                ),
              ],
            ),
            // titulo de la pagina
            // ----------------------
            Text(
              'Carpetas',
              style:
                  TextStyle(color: Color.fromRGBO(59, 56, 56, 1), fontSize: 18),
            ),
            // ponemos dentro de un container
            // nuestro Gridviw
            // -------------------------------
            Container(
              height: 400,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(40),
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text("He'd have you all unravel at the"),
                    color: Colors.teal[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Heed not the rabble'),
                    color: Colors.teal[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Sound of screams but the'),
                    color: Colors.teal[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Who scream'),
                    color: Colors.teal[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution is coming...'),
                    color: Colors.teal[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Color.fromRGBO(59, 56, 56, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.home),
                      color: Colors.white,
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.add_circle),
                      color: Colors.white,
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.loop_outlined),
                      color: Colors.white,
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),

      // ponemos la barra inferior
      // -----------------------------
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Color.fromRGBO(59, 56, 56, 1),
      //   // unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
      //   selectedItemColor: Color.fromRGBO(41, 141, 122, 1),
      //   unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
      //   selectedIconTheme:
      //       IconThemeData(color: Color.fromRGBO(41, 141, 122, 1)),
      //   onTap: (index) {
      //     if (index == 3) {
      //       print("hola mundo");
      //     } else if (index == 4) {
      //       print("hola mundo");
      //     } else {
      //       setState(() {
      //         _paginaActual = index;
      //       });
      //     }
      //   },
      //   // ponemos la barrra de navegador de abajo
      //   // el bottomnavigator------------------------
      //   currentIndex: _paginaActual,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.picture_as_pdf_rounded,
      //       ),
      //       label: "Actividades",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.add_circle,
      //       ),
      //       label: "Agregar",
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.edit,
      //         ),
      //         label: "Editar"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.delete,
      //         ),
      //         label: "Eliminar"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.loop_outlined), label: "Cargar")
      //   ],
      // ),
    );
  }
}
