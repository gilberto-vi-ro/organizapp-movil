import 'package:flutter/material.dart';
import 'package:organizapp/model/ActividadMoldel.dart';
import 'package:organizapp/provider/ActividadProvider.dart';

class ListoTab extends StatefulWidget {
  const ListoTab({Key key}) : super(key: key);

  @override
  _ListoTabState createState() => _ListoTabState();
}

class _ListoTabState extends State<ListoTab> {
@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // creamos la variable con el que iniciara el DropdownButton
    // que sera urgente
    String dropdwoncurrentvalue = "Urgente";
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
                items: <String>['Urgente', 'opcion3', 'opcion3']
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
                    dropdwoncurrentvalue = valueIn;
                  });
                },
              ),
            ),
            Container(
              height: 400,
              child: _listWidgetActividad(
                "1002","drive/1002","","","2021-02-15::2023-05-15"

              ),
            )
          ],
        ),
      ),
    );
  }

FutureBuilder _listWidgetActividad(id_user, path, priority, search, range) {
    return FutureBuilder(
      future: ActividadProvider.cargarActividad(id_user, path, priority, search, range),
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

}
