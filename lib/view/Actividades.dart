import 'package:flutter/material.dart';
import 'include/PaginaAgregarBar.dart';
import 'include/PaginaEditBar.dart';
import 'include/EntregadoTab.dart';
import 'include/PendienteTab.dart';
import 'include/ListoTab.dart';
import 'include/myWidget.dart';

class Actividades extends StatefulWidget {
  Actividades({Key key}) : super(key: key);

  @override
  ActividadesState createState() => ActividadesState();
}

class ActividadesState extends State<Actividades> {
  //property
  int _paginaActual = 0;
  //List<Widget> _paginas = [PaginaAgregarBar(), PaginaEditBar()];
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('OrganizApp');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(length: 3, child: Scaffold(appBar: AppBar(
    //   title: O,
    // ),))
    // controlador de los tabs
    // --------------------------------------------
    final myTabController = new DefaultTabController(
        length: 3,
        child: Scaffold(
          // comienza en menu amburgesa (drawer)
          // ----------------------------------------------
          drawer: myDrawer(context),
          // asemos los tabs dentro de un appBar
          // --------------------------------------
          appBar: _myAppBar(context),
          body: _myTabs(context),
          // body: _paginas[_paginaActual],
          bottomNavigationBar: _myBottomNavigationBar(context),
        ));

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myTabController,
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
                  customIcon = Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    //contentPadding: EdgeInsetsGeometry(),
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      onChanged: (value) {
                        setState(() {
                          ListoTabState.mySearch = value.toString();
                        });
                      },
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
                customIcon = Icon(Icons.search);
                customSearchBar = Text('OrganizApp');
                ListoTabState.mySearch = "";
              }
            });
          },
          icon: customIcon,
        )
      ],
    );
  }

  Widget _myTabs(BuildContext context) {
    return Column(
      // Column
      children: <Widget>[
        Container(
          color: Color.fromRGBO(219, 220, 222, 1), // Tab Bar color change
          child: TabBar(
            // TabBar
            //controller: tabController,
            unselectedLabelColor: Color.fromRGBO(59, 56, 56, 1),
            labelColor: Color.fromRGBO(41, 141, 122, 1),
            indicatorWeight: 4,
            indicatorColor: Color.fromRGBO(41, 141, 122, 1),
            tabs: <Widget>[
              Tab(
                text: "Pendiente",
              ),
              Tab(
                text: "Listo",
              ),
              Tab(
                text: "Entregado",
              )
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            //controller: tabController,
            children: <Widget>[
              new PendienteTab(),
              new ListoTab(),
              new EntregadoTab(),
            ],
          ),
        ),
      ],
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
            Icons.picture_as_pdf_rounded,
          ),
          label: "Actividades",
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
}
