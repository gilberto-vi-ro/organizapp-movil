import 'package:flutter/material.dart';
import 'package:organizapp/model/model_login.dart';
import 'package:organizapp/view/registrar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variable para contolar el formulario
  final formKey = GlobalKey<FormState>();
  // variables para validar los texformfield
  String valueusuario = "";
  String valuepasword = "";
  // en esta parte traemos la iformacion

  // String username = "admin";
  // String pwd = "admin";
  // Future<List> _listadoLogin;
  Future<String> _getLogin(valueuser, valuepwd) async {
    final response = await http.post(
      Uri.parse("https://myproyecto.com/organizapp-api/LoginController/login"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        "username": valueuser,
        "pwd": valuepwd,
      },
      encoding: Encoding.getByName("utf-8"),
    );
    Map<String, dynamic> datajson = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      final res = datajson["response"][0]["type"];
      if (res == "success")
        Navigator.pushReplacementNamed(context, "DrawerM");
      else {
        String msg = datajson["response"][0]["msg"];
        showDialog(
            context: context,
            builder: (buildcontext) {
              return AlertDialog(
                backgroundColor: Color.fromRGBO(232, 245, 251, 1),
                title: Text(
                  "Digite nuevamente sus datos",
                  style: TextStyle(color: Color.fromRGBO(41, 141, 122, 1)),
                ),
                content: Text(msg, style: TextStyle(color: Colors.red)),
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
      // print(datajson["response"][0]["msg"]);
      // print(datajson["response"][0]["msg"]);
    } else {
      throw Exception("Fallo la conexion");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        onChanged: (value) =>
                            this.valueusuario = value.toString(),
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
                        validator: (value) {
                          if (value.isEmpty)
                            return "introduce un usuario valido";
                          else
                            return null;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        onChanged: (value) =>
                            this.valuepasword = value.toString(),
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
                        validator: (value) {
                          if (value.isEmpty)
                            return "introduce un password valido";
                          else
                            return null;
                        },
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
                          onPressed: () => _submit()),
                    ),
                    // boton de registrar
                    Container(
                      child: MaterialButton(
                        child: Container(child: Text('Registrate aqui!')),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => registrar()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _submit() {
    if (formKey.currentState.validate())
      // _getLogin(valueusuario, valuepasword);
      Navigator.pushReplacementNamed(context, "DrawerM");
    else
      return;
    // print(valueusuario);
    // print(valuepasword);
  }
}




// List<Widget> listado(List<dynamic> info) {
//   List<Widget> lista = [];
//   info.forEach((elemento) {
//     lista.add(Text(elemento["name"]));
//   });
//   return lista;
// }
