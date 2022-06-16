import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:organizapp/model/CarpetaModel.dart';

class CarpetaProvider {
  static String msg_title = "";
  static String msg_text = "";
  // final String _urlDB =
  // 'https://myesp8266-integradora-5bd80-default-rtdb.firebaseio.com/';

  static Future<List<CarpetaModel>> cargarCarpeta(
      value_id_user, value_pathname) async {
    try {
      // final urlConexion = '$_urlDB/alumnos.json';
      // final resp = await http.get(urlConexion);
      final response = await http.post(
        Uri.parse(
            "https://myproyecto.com/organizapp-api/FolderController/listAll/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          "id_user": value_id_user,
          "pathname": value_pathname,
        },
        encoding: Encoding.getByName("utf-8"),
      );
      final Map<String, dynamic> decodeData = json.decode(response.body);

      final List<CarpetaModel> listaCarpetas = new List();

      if (decodeData["type"] != "success") return [];

      //print(decodeData["data"]);
      decodeData["data"].forEach((element) {
        final newCarpeta = CarpetaModel.fromJson(element);
        listaCarpetas.add(newCarpeta);
      });

      return listaCarpetas;
    } catch (e) {
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
