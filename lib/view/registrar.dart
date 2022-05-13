import 'package:flutter/material.dart';

class registrar extends StatelessWidget {
  const registrar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('OrganizApp'),
      ),
      backgroundColor: Color.fromRGBO(232, 245, 251, 1),
      body: SingleChildScrollView(
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
              labelText: 'Nombre completo'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _userTexfield() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(41, 141, 121, 1),
              ),
              hintText: 'Nombre de usuario',
              labelText: 'Nombre de usuario'),
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
              labelText: 'Contraseña'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _verifpasswordTextField() {
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
              hintText: 'Verificar contraseña',
              labelText: 'Verificar contraseña'),
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
                'Registrar',
                style: TextStyle(color: Color.fromRGBO(232, 245, 251, 1)),
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {},
        ),
      );
    });
  }
}
