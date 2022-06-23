import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:organizapp/model/CarpetaModel.dart';
import 'package:organizapp/provider/carpetaProvider.dart';
import 'include/PaginaAgregarBar.dart';
import 'include/PaginaEditBar.dart';
import 'include/myWidget.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;

class Carpetas extends StatefulWidget {
  const Carpetas({Key key}) : super(key: key);

  @override
  _CarpetasState createState() => _CarpetasState();
}

class _CarpetasState extends State<Carpetas> {
  // agregamos estas variable para que funcione la
  // barra inferior
  // ------------------------------------------------
  //final m = PaginaAgregarBar();
  int _paginaActual = 0;
  //List<Widget> _paginas = [PaginaAgregarBar(), PaginaEditBar()];
  bool checkBoxValue = false;
  List<int> listCheck = new List();
  final _key = GlobalKey();
  bool _isVisible = true;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('OrganizApp');

//  lista de carpetas
// ------------------------------------------
  List<Widget> listApi = <Widget>[];
  @override
  void initState() {
    super.initState();
  }
  // Future<String> _listFolder(valueIdUser, valuePathname) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(
  //           "https://myproyecto.com/organizapp-api/FolderController/listAll/"),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/x-www-form-urlencoded"
  //       },
  //       body: {
  //         "id_user": valueIdUser,
  //         "pathname": valuePathname,
  //       },
  //       encoding: Encoding.getByName("utf-8"),
  //     );

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> datajson = jsonDecode(response.body.toString());

  //       final res = datajson["type"];
  //       if (res == "success") {
  //         // myShowDialog("Exitoso", datajson["data"][0]["name"]);
  //         // print(datajson["data"]);
  //         // listApi = <Widget>[
  //         //   Container(
  //         //     padding: const EdgeInsets.all(8),
  //         //     child: const Text("He'd have you all unravel at the"),
  //         //     color: Colors.teal[100],
  //         //   ),
  //         //   Container(
  //         //     padding: const EdgeInsets.all(8),
  //         //     child: const Text("He'd have you all unravel at the"),
  //         //     color: Colors.teal[100],
  //         //   ),
  //         // ];
  //       } else {
  //         String msg = datajson["data"]["msg"];
  //         myShowDialog("error", msg);
  //       }

  //       // print(datajson["response"][0]["msg"]);
  //       // print(datajson["response"][0]["msg"]);
  //     } else {
  //       myShowDialog("Error", "Ocurrio un error.");
  //     }
  //   } catch (e) {
  //     if (e.toString() == "XMLHttpRequest error.")
  //       myShowDialog("Error", "No hay conexion a internet");
  //     else
  //       myShowDialog("Error", e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final TabController = new DefaultTabController()
    //     length: 3,
    return Scaffold(
      // ponemos el apBar (barra menu)
      // ----------------------------------------------
      appBar: _myAppBar(context),

//  ponemos el drawer en esta pagina
// --------------------------------------------------
      drawer: myDrawer(context),

      // ponemos el scrolvio para el sclol de la ap
      // dentro de este pondremas lo siguinente

      body: _mySingleChildScrollView(context),

      // ponemos la barra inferior en archivo carpetas
      // ------------------------------------------------
      bottomNavigationBar: _myBottomNavigationBar(context),
    );
  }

  Widget _myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(41, 141, 122, 1),
      centerTitle: true,
      title: customSearchBar,
      //automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    //contentPadding: EdgeInsetsGeometry(),
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              } else {
                customIcon = const Icon(Icons.search);
                customSearchBar = const Text('OrganizApp');
              }
            });
          },
          icon: customIcon,
        )
      ],
    );
  }

  Widget _mySingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
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
            height: 800,
            child: _listWidgetFolder("1002", "drive/1002"),
          ),
        ],
      ),
    );
  }

  Widget _myBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(59, 56, 56, 1),
      // unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
      selectedItemColor: Color.fromRGBO(41, 141, 122, 1),
      unselectedItemColor: Color.fromRGBO(232, 245, 251, 1),
      selectedIconTheme: IconThemeData(color: Color.fromRGBO(41, 141, 122, 1)),
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
            Icons.folder,
          ),
          label: "Carpetas",
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
    );
  }

  myAlertDialog(msgTitle, msgContent, BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: AlertDialog(
        key: _key,
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
              setState(() {
                _isVisible = !_isVisible;
              });
              //print();
              //Navigator.pop(context.widget);
              //Navigator.pushReplacementNamed(context, Key("AlertDialog"));
              // Navigator.of( ValueKey("1000") );
              // Navigator.removeAt(Key("1000"));
              // this.removeAt();
              //_key.currentContext;
            },
          )
        ],
      ),
    );
  }

  FutureBuilder _listWidgetFolder(valueIdUser, valuePathname) {
    return FutureBuilder(
      future: CarpetaProvider.cargarCarpeta(valueIdUser, valuePathname),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            //children: snapshot.data,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2.5 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) =>
                _crearItem(snapshot.data[i], context, i),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          var message = CarpetaProvider.msgText;
          //if (snapshot.data.runtimeType == http.Response)
          return myAlertDialog("Error", message, context);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(CarpetaModel carpeta, BuildContext context, i) {
    Icon myIcon = Icon(
      Icons.folder,
    );
    if (carpeta.is_dir) {
    } else {
      if (carpeta.extension == "pdf") {
        myIcon = Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
        );
      } else if (carpeta.extension == "jpg" ||
          carpeta.extension == "png" ||
          carpeta.extension == "gif") {
        myIcon = Icon(
          Icons.image,
        );
      } else
        myIcon = Icon(
          Icons.file_copy,
        );
    }

    if (listCheck.indexOf(i) == -1) {
      // si  no esta en la lista
      checkBoxValue = false;
    } else {
      // si esta en la lista
      checkBoxValue = true;
    }

    // retornando el card(contenndores del GridView)
    // ------------------------------------------------
    return GestureDetector(
      onLongPress: () {
        //myShowDialog("long press", "");
        setState(() {
          // if (checkBoxValue)
          //   checkBoxValue = false;
          // else
          //   checkBoxValue = true;
          //print(listCheck);
          //print(listCheck.indexOf(i));
          if (listCheck.contains(i)) {
            listCheck.remove(i);
          } else {
            listCheck.add(i); // agregamos el indice a la list
          }
        });
      },
      onTap: () => myShowDialog("on tap", "", context),
      child: Card(
          key: Key(carpeta.path_name),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Color.fromRGBO(219, 220, 222, 1),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(left: 10),
                child: Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool newValue) {
                      //checkBoxValue = newValue;
                      //listCheck.add(i);
                      //checkBoxValue = false;
                    }),
              ),
              Expanded(
                  child: IconButton(
                splashColor: Colors.red,
                alignment: Alignment.center,
                color: Color.fromRGBO(59, 134, 232, 1),
                iconSize: 80,
                onPressed: () {},
                icon: myIcon,
              )),
              Text(
                carpeta.name,
              ),
            ],
          )),
    );
  }
}
