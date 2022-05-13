import 'package:flutter/material.dart';
import 'package:organizapp/model/model_login.dart';
import 'package:organizapp/view/registrar.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //en esta parte traemos la iformacion
  String username = "admin";
  String pwd = "admin";
  // Future<List> _listadoLogin;
  Future<String> _getLogin() async {
    final response = await http.post(
      Uri.parse(
          "https://myproyecto.com/organizapp-api/HomeController/listFolder/"),
      body: {
        "id_user": "1001",
        "path": "drive/1001/",
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("Fallo la conexion");
    }
  }

  @override
  void initState() {
    super.initState();
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'OrganizApp',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
          )),
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Login',
              style:
                  TextStyle(color: Color.fromRGBO(59, 56, 56, 1), fontSize: 20),
            ),
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/logoapp.png',
              height: 100.0,
              width: 150.0,
            ),
            // ponemos el singleChilScrolViu para que escrolee el login
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          icon: Icon(
                            Icons.person,
                            color: Color.fromRGBO(41, 141, 122, 1),
                          ),
                          hintText: 'Usuario',
                          labelText: 'Usuario'),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          icon: Icon(
                            Icons.lock,
                            color: Color.fromRGBO(41, 141, 121, 1),
                          ),
                          hintText: 'Contraseña',
                          labelText: 'Contraseña'),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: RaisedButton(
                        color: Color.fromRGBO(41, 141, 122, 1),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 15.0),
                          child: Text(
                            'Acceder',
                            style: TextStyle(
                                color: Color.fromRGBO(232, 245, 251, 1)),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onLongPress: () {
                          Text('hola mundo');
                        }),
                  ),
                  // boton de registrar
                  Container(
                    child: MaterialButton(
                      child: Container(child: Text('Registrate aqui!')),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => registrar()),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

// List<Widget> listado(List<dynamic> info) {
//   List<Widget> lista = [];
//   info.forEach((elemento) {
//     lista.add(Text(elemento["name"]));
//   });
//   return lista;
// }
