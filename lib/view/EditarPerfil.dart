import 'package:flutter/material.dart';
import 'include/myWidget.dart';

class EditarPerfil extends StatelessWidget {
  const EditarPerfil({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      appBar: AppBar(
        title: Text('OrganizApp'),
        centerTitle: true,
      ),
      // ponemos el drawer en esta pantalla de perfil par tener el menu
      //---------------------------------------------
      // backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      drawer: myDrawer(context),

      //cramos los formularios para editar el perfil
      // ----------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Editar Perfil',
              style:
                  TextStyle(color: Color.fromRGBO(59, 56, 56, 1), fontSize: 16),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: RaisedButton(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //     // borderRadius: BorderRadius.circular(100),
                //     // side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0)),
                //     ),
                color: Color.fromRGBO(232, 245, 251, 1),
                child: Image.asset('assets/icon-user-camera.png'),
                onPressed: () {},
              ),
              width: 120,
              height: 120,
            ),
            _nombretexFiels(),
            _passwordTextField(),
            SizedBox(
              height: 10.0,
            ),
            _butooCuenta(),
            _butoonTextField(),
          ],
        ),
      ),
    );
  }

  Widget _nombretexFiels() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(41, 141, 122, 1),
              ),
              hintText: 'Nombre completo',
              labelText: 'Nombre completo',
              suffixIcon: IconButton(
                  icon:
                      Icon(Icons.edit, color: Color.fromRGBO(41, 141, 121, 1)),
                  onPressed: () {})),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(41, 141, 121, 1),
              ),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                  icon:
                      Icon(Icons.edit, color: Color.fromRGBO(41, 141, 121, 1)),
                  onPressed: () {})),
          onChanged: (value) {},
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
                'Guardar',
                style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {},
        ),
      );
    });
  }

  Widget _butooCuenta() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return SingleChildScrollView(
          child: Column(
        // padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Color.fromRGBO(41, 141, 122, 1),
                  ),
                  // listo pra programar
                  onPressed: () {}),
              Text(
                'Cuenta',
                style: TextStyle(color: Color.fromRGBO(59, 56, 56, 1)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Eliminar Cuenta',
                style: TextStyle(color: Color.fromRGBO(59, 56, 56, 1)),
                textAlign: TextAlign.right,
              ),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Color.fromRGBO(41, 141, 122, 1),
                  ),
                  // listo pra programar
                  onPressed: () {})
            ],
          )
        ],
      ));
    });
  }
}
