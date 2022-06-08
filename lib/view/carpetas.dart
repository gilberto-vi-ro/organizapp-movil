import 'package:flutter/material.dart';
import 'package:organizapp/view/DrawerM.dart';
import 'package:organizapp/view/carp1.dart';
import 'package:organizapp/model/CarpetaModel.dart';
import 'package:organizapp/provider/carpetaProvider.dart';

import 'include/agregarBar.dart';
import 'include/editarBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Carpetas extends StatefulWidget {
  const Carpetas({Key key}) : super(key: key);

  @override
  _CarpetasState createState() => _CarpetasState();
}

class _CarpetasState extends State<Carpetas> {
  // agregamos estas variable para que funcione la
  // barra inferior
  // ------------------------------------------------
  final m = PaginaAgregarBar();
  int _paginaActual = 0;
  List<Widget> _paginas = [PaginaAgregarBar(), PaginaEditBar()];

//  lista de carpetas
// ------------------------------------------

  List<Widget> listApi = <Widget>[];

  @override
  void initState() {
    // super.initState();
  }

  Future<String> _listFolder(value_id_user, value_pathname) async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://myproyecto.com/organizapp-api/FolderController/listAll/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          "id_user": value_id_user,
          "pathname": value_pathname,
        },
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> datajson = jsonDecode(response.body.toString());

        final res = datajson["type"];
        if (res == "success") {
          // myShowDialog("Exitoso", datajson["data"][0]["name"]);
          // print(datajson["data"]);
          // listApi = <Widget>[
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     child: const Text("He'd have you all unravel at the"),
          //     color: Colors.teal[100],
          //   ),
          //   Container(
          //     padding: const EdgeInsets.all(8),
          //     child: const Text("He'd have you all unravel at the"),
          //     color: Colors.teal[100],
          //   ),
          // ];
        } else {
          String msg = datajson["data"]["msg"];
          myShowDialog("error", msg);
        }

        // print(datajson["response"][0]["msg"]);
        // print(datajson["response"][0]["msg"]);
      } else {
        myShowDialog("Error", "Ocurrio un error.");
      }
    } catch (e) {
      if (e.toString() == "XMLHttpRequest error.")
        myShowDialog("Error", "No hay conexion a internet");
      else
        myShowDialog("Error", e.toString());
    }
  }

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
              child: _listWidgetFolder("1002", "drive/1002"),
              // child: GridView.count(
              //   primary: false,
              //   padding: const EdgeInsets.all(40),
              //   crossAxisSpacing: 8,
              //   mainAxisSpacing: 10,
              //   crossAxisCount: 2,
              //   children: _listWidgetFolder("1002", "drive/1002"),
              // ),
            ),
          ],
        ),
      ),

      // ponemos la barra inferior en archivo carpetas
      // ------------------------------------------------
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
            setState(() {
              _paginaActual = index;
            });
          }
        },
        // ponemos la barrra de navegador de abajo
        // el bottomnavigator------------------------
        currentIndex: _paginaActual,
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

  myShowDialog(msTitle, msContent) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(232, 245, 251, 1),
            title: Text(
              msTitle,
              style: TextStyle(color: Color.fromRGBO(41, 141, 122, 1)),
            ),
            content: Text(msContent, style: TextStyle(color: Colors.red)),
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

  // Widget _listWidgetFolder(value_id_user, value_pathname) {
  //   return FutureBuilder(
  //     future: CarpetaProvider.cargarCarpeta(value_id_user, value_pathname),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<CarpetaModel>> snapshot) {
  //       if (snapshot.hasData) {
  //         return ListView.builder(
  //           itemCount: snapshot.data.length,
  //           itemBuilder: (context, i) => _crearItem(snapshot.data[i], context),
  //         );
  //       } else {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   );
  // }
  // Widget _crearItem(CarpetaModel carpeta, BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(8),
  //     child: const Text("He'd have you all unravel at the"),
  //     color: Colors.teal[100],
  //   );
  FutureBuilder _listWidgetFolder(value_id_user, value_pathname) {
    return FutureBuilder(
      future: CarpetaProvider.cargarCarpeta(value_id_user, value_pathname),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            //children: snapshot.data,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,

              //primary: false,
              //   padding: const EdgeInsets.all(40),
              //   crossAxisSpacing: 8,
              //   mainAxisSpacing: 10,
              //   crossAxisCount: 2,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) => _crearItem(snapshot.data[i], context),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(CarpetaModel carpeta, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(carpeta.name),
      decoration: BoxDecoration(
          color: Colors.teal[100], borderRadius: BorderRadius.circular(15)),
    );
    // Future<List<Widget>> _dataList(value_id_user, value_pathname) async{
    //   List<CarpetaModel> list = CarpetaProvider.cargarCarpeta(value_id_user, value_pathname);
    //   return list.map((m)=>ListTile(
    //     title: m.path
    //   )).ToList();

    // }

    // return Dismissible(
    //   key: UniqueKey(),
    //   background: Container(
    //     color: Colors.redAccent,
    //   ),
    //   onDismissed: (dir) => carpetaProvider.eleminarAlumno(alumno.id),
    //   child: ListTile(
    //     leading: CircleAvatar(backgroundImage: _validarImagen(alumno)),
    //     title: Text('${alumno.nombre} ${alumno.apellidos}'),
    //     subtitle: Text(alumno.id),
    //     trailing: Icon(Icons.keyboard_arrow_right),
    //     onTap: () => Navigator.pushNamed(context, 'carpeta', arguments: carpeta)
    //         .then((value) {
    //       setState(() {});
    //     }),
    //   ),
    // );
  }
}
