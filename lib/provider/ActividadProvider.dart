import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:organizapp/model/ActividadMoldel.dart';

class ActividadProvider {
  static String msg_title = "";
  static String msg_text = "";
  // final String _urlDB =
  // 'https://myesp8266-integradora-5bd80-default-rtdb.firebaseio.com/';

  static Future<List<ActividadModel>> cargarActividad(
      id_user, path, priority, search, range) async {
    try {
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
          "path": path,
          "priority": priority,
          "search": search,
          "range": range,
        },
        encoding: Encoding.getByName("utf-8"),
      );

      // if (response.statusCode == 200) {
      //   // Si el servidor devolvió una respuesta 200 OK,
      //   // Imprimir respuesta
      //   print(response.body);
      // } else {
      //   print("herror");
      // }

      final Map<String, dynamic> decodeData = json.decode(response.body);

      final List<ActividadModel> listaActividad = new List();

      if (decodeData["type"] != "success") return [];
      //print(decodeData["data"]);
      decodeData["data"].forEach((element) {
        final newActividad = ActividadModel.fromJson(element);
        listaActividad.add(newActividad);
      });
      return listaActividad;
    } catch (e, stacktrace) {
      if (e.toString() == "XMLHttpRequest error.") {
        msg_title = "Error";
        msg_text = "No hay conexion a internet";
      } else {
        msg_title = "Error";
        msg_text = e.toString();
      }
    }
  }

  static String getMsgTitle() {
    return msg_title;
  }

  static String getMsgText() {
    return msg_text;
  }
}
