import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class registrar extends StatefulWidget {
  const registrar({Key key}) : super(key: key);

  @override
  State<registrar> createState() => _registrarState();
}

class _registrarState extends State<registrar> {
  // valibles para eveluar si las cajas de texto estan vasias
  // y me envie los mensajes de advertencia
  String value_name = "";
  String value_user = "";
  String value_password = "";
  String value_confPassword = "";
  // --------------------------------------------
  // variable global para validar form
  final formKeyRegistro = GlobalKey<FormState>();
  // ----------------------------------------------
  Future<String> _getRegistrar(username, nombre_c, pwd) async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://myproyecto.com/organizapp-api/LoginController/registerUser"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          "username": username,
          "nombre_c": nombre_c,
          "pwd": pwd,
        },
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> datajson = jsonDecode(response.body.toString());
        final res = datajson["response"][0]["type"];
        if (res == "success")
          myShowDialog("Exitoso", "Usuario registrado");
        else {
          String msg = datajson["response"][0]["msg"];
          myShowDialog("Digite nuevamente sus datos", msg);
        }
        // print(datajson["response"][0]["msg"]);
        // print(datajson["response"][0]["msg"]);
      } else {
        myShowDialog("Error", "Ocurrio un error.");
      }
    } catch (e) {
      myShowDialog("Error", "No hay conexion a internet.");
    }
  }

  // -----------------------------------------------------
  // -----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('OrganizApp'),
      ),
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      body: SingleChildScrollView(
        child: Form(
          key: formKeyRegistro,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: RaisedButton(
                  elevation: 0,
                  // shape: RoundedRectangleBorder(
                  //     // borderRadius: BorderRadius.circular(100),
                  //     // side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0)),
                  //     )
                  color: Color.fromRGBO(232, 245, 251, 1),
                  child: Image.asset('assets/icon-user-camera.png'),
                  onPressed: () {},
                ),
                width: 150,
                height: 150,
              ),
              _nombretexFiels(),
              _userTexfield(),
              _passwordTextField(),
              _verifpasswordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _butoonTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nombretexFiels() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          onChanged: (value) => this.value_name = value.toString(),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(41, 141, 122, 1),
              ),
              hintText: 'Nombre completo',
              labelText: 'Nombre completo'),
          validator: (value) {
            if (value.isEmpty)
              return "Introduce un nombre Valido";
            else
              return null;
          },
        ),
      );
    });
  }

  Widget _userTexfield() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          onChanged: (value) => this.value_user = value.toString(),
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(41, 141, 121, 1),
              ),
              hintText: 'Nombre de usuario',
              labelText: 'Nombre de usuario'),
          validator: (value) {
            if (value.isEmpty)
              return "Introduce un ombre de usuario valido";
            else
              return null;
          },
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          onChanged: (value) => this.value_password = value.toString(),
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(41, 141, 121, 1),
              ),
              hintText: 'Contraseña',
              labelText: 'Contraseña'),
          validator: (value) {
            if (value.isEmpty)
              return "Introduce un contraseña vailida";
            else
              return null;
          },
        ),
      );
    });
  }

  Widget _verifpasswordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          onChanged: (value) => this.value_confPassword = value.toString(),
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(41, 141, 121, 1),
              ),
              hintText: 'Verificar contraseña',
              labelText: 'Verificar contraseña'),
          validator: (value) {
            if (value.isEmpty)
              return "Introduce una contraseña valida";
            else
              return null;
          },
        ),
      );
    });
  }

  Widget _butoonTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        child: RaisedButton(
            color: Color.fromRGBO(41, 141, 122, 1),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
                )),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () => _registrar()),
      );
    });
  }

  _registrar() {
    if (formKeyRegistro.currentState.validate()) {
      if (value_password == value_confPassword)
        _getRegistrar(value_name, value_user, value_password);
      else {
        myShowDialog(
            "Digite nuevamente sus datos", "Las contraseñas no considen");
      }
    } else
      return;
    // print(valueusuario);
    // print(valuepasword);
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

  httpGet() async {
    // try {
    //   var url =
    //       Uri.https('www.googleapis.com', '/books/v1/volumes', {'q_': 'hola'});
    //   var response = await http.get(url);
    //   // if (response.statusCode == 200) {
    //   //   myShowDialog("Error", '${response.statusCode}.');
    //   // } else {
    //   //   myShowDialog(
    //   //       "Error", 'Request failed with status: ${response.statusCode}.');
    //   // }
    //   return 1;
    // } catch (e) {
    //   myShowDialog("Error", "No hay conexion a internet.");
    //   return 0;
    // }
  }
}
