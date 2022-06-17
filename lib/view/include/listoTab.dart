import 'package:flutter/material.dart';
import 'package:organizapp/model/ActividadMoldel.dart';
import 'package:organizapp/provider/ActividadProvider.dart';

class ListoTab extends StatefulWidget {
  const ListoTab({Key key}) : super(key: key);

  @override
  _ListoTabState createState() => _ListoTabState();
}

class _ListoTabState extends State<ListoTab> {
  bool _isVisible = true;
  String dropdwoncurrentvalue = "All";
  String id_user = "1002",
      path = "drive/1002",
      priority = "",
      search = "",
      range = "2020-02-15::2023-05-15";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // creamos la variable con el que iniciara el DropdownButton
    // que sera urgente

    return Scaffold(
      //en esta parte se acran los GridVio y contenedores
      // ------------------------------------------------------
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      // este appbar sirve para poner nuestra barra de
      // path y el boton------------------------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(232, 245, 251, 1),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(41, 141, 122, 1),
            ),
            onPressed: () {}),
        title: Text(
          "Carpeta1/Carpeta2/carpeta3",
          style:
              TextStyle(fontSize: 15, color: Color.fromRGBO(41, 141, 122, 1)),
        ),
      ),
      // hacemos el Gridviw  en esta parte de inicion tab
      // que es el pendiente tab
      // ------------------------------------------

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Actividades',
              style:
                  TextStyle(color: Color.fromRGBO(59, 56, 56, 1), fontSize: 18),
            ),
            Container(
              height: 50,
              child: DropdownButton(
                items: <String>["All", "Urgente", "Importante", "No urgente"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: dropdwoncurrentvalue,
                icon: Icon(
                  Icons.arrow_drop_up_sharp,
                  size: 30,
                ),
                iconSize: 15,
                elevation: 16,
                underline: Container(
                  height: 3,
                  color: Color.fromRGBO(41, 141, 121, 1),
                ),
                onChanged: (String valueIn) {
                  setState(() {
                    switch (dropdwoncurrentvalue) {
                      case "All":
                        {
                          priority = "";
                        }
                        break;

                      case "Urgente":
                        {
                          priority = "1";
                        }
                        break;
                      case "Importante":
                        {
                          priority = "2";
                        }
                        break;
                      case "No urgente":
                        {
                          priority = "3";
                        }
                        break;

                      default:
                        {
                          priority = "";
                        }
                        break;
                    }

                    dropdwoncurrentvalue = valueIn;
                  });
                },
              ),
            ),
            Container(
              height: 400,
              child: _listWidgetActividad(),
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder _listWidgetActividad() {
    return FutureBuilder(
      future: ActividadProvider.cargarActividad(
          id_user, path, priority, search, range),
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

              //primary: false,
              //   padding: const EdgeInsets.all(40),
              //   crossAxisSpacing: 8,
              //   mainAxisSpacing: 10,
              //   crossAxisCount: 2,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) => _crearItem(snapshot.data[i], context),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          var message = ActividadProvider.getMsgText();
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

  Widget _crearItem(ActividadModel actividad, BuildContext context) {
    Icon myIcon = Icon(
      Icons.local_activity,
    );

    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Color.fromRGBO(219, 220, 222, 1),
        child: Column(
          children: <Widget>[
            Expanded(
                child: IconButton(
              alignment: Alignment.center,
              color: Color.fromRGBO(59, 134, 232, 1),
              iconSize: 80,
              onPressed: () {},
              icon: myIcon,
            )),
            Text(
              actividad.tarea_nombre,
            ),
          ],
        ));
  }

  myAlertDialog(msgTitle, msgContent, BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: AlertDialog(
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
}
