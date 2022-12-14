import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_final/Models/Miembro.dart';

class Miembro_Api {
  static Future<List<Miembro_Model>> GetMiembro_Model() async {
    List<Miembro_Model> listServicios = [];
    http.Response response = await http
        .get(Uri.parse("https://adamix.net/defensa_civil/def/miembros.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Miembro_Model(
        Cargo: data["datos"][i]["cargo"],
        Nombre: data["datos"][i]["nombre"],
        Foto: data["datos"][i]["foto"],
      ));
    }

    return listServicios;
  }
}
