import 'package:flutter/material.dart';

class EntregadoTab extends StatefulWidget {
  const EntregadoTab({Key key}) : super(key: key);

  @override
  _EntregadoTabState createState() => _EntregadoTabState();
}

class _EntregadoTabState extends State<EntregadoTab> {
  @override
  Widget build(BuildContext context) {
    String dropdwoncurrentvalue = "Urgente";
    return Scaffold(
      // ponemos el Gridview en esta pagina tambien entregado
      // tabBar--------------------------------------------
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
            )
          ],
        ),
      ),
    );
  }
}
