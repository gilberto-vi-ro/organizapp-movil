import 'package:flutter/material.dart';
import 'package:organizapp/model/ActividadMoldel.dart';
import 'package:organizapp/provider/ActividadProvider.dart';
import 'myWidget.dart';

class ListoTab extends StatefulWidget {
  //propiedad
  //String search = "hola mundo";
  // constructor
  ListoTab({Key key}) : super(key: key);
  //ListoTab(this.search, {Key key}) : super(key: key);
  //ListoTab(this.search);

  @override
  ListoTabState createState() => ListoTabState();
}

class ListoTabState extends State<ListoTab> {
  /*------------------------------------------------------------------------------
  Static property
  --------------------------------------------------------------------------------*/
  static String mySearch = "";
  static DateTime dateNow = DateTime.now();
  /*------------------------------------------------------------------------------
  Property
  --------------------------------------------------------------------------------*/
  bool checkBoxValue = false;
  List<int> listCheck = new List();
  bool visibilityCheckbox = false;
  DateTime dateTomorrow;
  DateTime date1;
  DateTime date2;
  bool _isVisible = true;
  String dropdwoncurrentvalue = "All";
  String id_user = "1002",
      path = "drive/",
      priority = "",
      search,
      range = "2020-02-15::2023-05-15";
  /*------------------------------------------------------------------------------
  Constraint
  --------------------------------------------------------------------------------*/
  ListoTabState() {
    // Fecha de manana
    dateTomorrow = new DateTime(dateNow.year, dateNow.month, dateNow.day + 2);
    // Segunda fecha, restandole dias a la variable
    date1 = new DateTime(dateNow.year, dateNow.month, dateNow.day - 15);
    // Segunda fecha, sumandole dias a la variable
    date2 = new DateTime(dateNow.year, dateNow.month, dateNow.day + 15);
    // Estableciendo el path de las actividaes
    path = "drive/" + id_user;
    // Estableciendo el rango de fecha de las actividades
    range =
        "${date1.year}-${date1.month}-${date1.day}::${date2.year}-${date2.month}-${date2.day}";
  }
  /*------------------------------------------------------------------------------*/
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (search != mySearch) {
      search = mySearch;
      //print(mySearch);
      setState(() {});
    }

    return Scaffold(
      //En esta parte se acran los GridVio y contenedores
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      // Este appbar sirve para poner nuestra barra de path y el boton
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
          path,
          style:
              TextStyle(fontSize: 15, color: Color.fromRGBO(41, 141, 122, 1)),
        ),
      ),
      // hacemos el Gridviw  en esta parte de inicion tab que es el pendiente tab
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
                    dropdwoncurrentvalue = valueIn;
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
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () {
                    _selectDate(date1, "date1", context);
                  },
                ),
                Text("${date1.day}/${date1.month}/${date1.year}"),
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () {
                    _selectDate(date2, "date2", context);
                  },
                ),
                Text(
                  "${date2.day}/${date2.month}/${date2.year}",
                  // textAlign: TextAlign.right,
                ),
              ],
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
            itemBuilder: (context, i) =>
                _crearItem(snapshot.data[i], context, i),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          var message = ActividadProvider.msgText;
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

  Widget _crearItem(ActividadModel actividad, BuildContext context, int i) {
    Image myIcon = Image.asset('assets/task.png', height: 80.0);
    Color txtColor = Color.fromRGBO(59, 56, 56, 1);
    DateTime activityDeliveryDate =
        DateTime.parse(actividad.tarea_fecha_entrega);
    if (activityDeliveryDate.compareTo(dateTomorrow) < 0)
      txtColor = Color.fromRGBO(205, 92, 92, 1);

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
        myShowDialog("long press", "", context);
      },
      onTap: () {
        visibilityCheckbox = true;
        setState(() {
          if (listCheck.contains(i)) {
            listCheck.remove(i);
          } else {
            listCheck.add(i); // agregamos el indice a la list
          }
          if (listCheck.length == 0) visibilityCheckbox = false;
        });
      },
      child: Card(
        key: Key("${actividad.id_tarea}"),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Color.fromRGBO(219, 220, 222, 1),
        child: Stack(
          //position absolute
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Positioned(
              child: Container(
                  child: Text(actividad.tarea_fecha_entrega,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: txtColor))),
              top: 10.0,
              right: 14.0,
            ),
            Center(child: myIcon),
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 130, 5, 5),
                    child: Text(actividad.tarea_nombre,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(color: txtColor)))),
            Positioned(
              child: Container(
                  color: Color.fromRGBO(219, 220, 222, 1),
                  child: myVisibilityCheckbox(visibilityCheckbox)),
              right: 5.0,
              top: 1.0,
            ),
          ],
        ),
      ),
    );
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
        content: Text(msgContent,
            style: TextStyle(color: Color.fromRGBO(205, 92, 92, 1))),
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

  Widget myVisibilityCheckbox(bool visibilityCheckbox) {
    if (visibilityCheckbox) {
      return Checkbox(
          activeColor: Color.fromRGBO(41, 141, 122, 1),
          value: checkBoxValue,
          onChanged: (bool newValue) {
            //checkBoxValue = newValue;
            //listCheck.add(i);
            //checkBoxValue = false;
          });
    } else {
      return SizedBox.shrink();
    }
  }

  //-----------------------------------------------------------------------------
  // Metodo para seleccionar feccha
  _selectDate(DateTime selectedDate, String where, BuildContext context) async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        if (where == "date1")
          date1 = selected;
        else if (where == "date2") date2 = selected;

        range =
            "${date1.year}-${date1.month}-${date1.day}::${date2.year}-${date2.month}-${date2.day}";
      });
  }
}
