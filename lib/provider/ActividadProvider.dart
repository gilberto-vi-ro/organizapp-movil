import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:organizapp/model/ActividadMoldel.dart';
class ActividadProvider {
  // final String _urlDB =
  // 'https://myesp8266-integradora-5bd80-default-rtdb.firebaseio.com/';

  static Future<List<ActividadModel>> cargarActividad(
      id_user,path,priority,search,range) async {
    // final urlConexion = '$_urlDB/alumnos.json';
    // final resp = await http.get(urlConexion);
    final response = await http.post(
      Uri.parse(
          "https://myproyecto.com/organizapp-api/HomeController/listTaskDone/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        "id_user": id_user,
        "pathn": path,
        "priority": priority,
        "search": search,
        "range": range,

      },
      encoding: Encoding.getByName("utf-8"),
    );
    final Map<String, dynamic> decodeData = json.decode(response.body);
    
    final List<ActividadModel> listaActividad = new List();
      print(decodeData);
    if (decodeData["type"] != "success") return [];

    print(decodeData["data"]);
    decodeData["data"].forEach((element) {
      final newActividad = ActividadModel.fromJson(element);
      listaActividad.add(newActividad);
    });

    return listaActividad;
  }
}
