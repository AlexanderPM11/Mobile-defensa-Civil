import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Albergue.dart';
import '../Models/Noticia.dart';

class Albergue_Api {
  static Future<List<Albergue>> GetAlbergue() async {
    List<Albergue> listServicios = [];
    http.Response response = await http
        .get(Uri.parse("https://adamix.net/defensa_civil/def/albergues.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Albergue(
        capacidad: data["datos"][i]["capacidad"],
        ciudad: data["datos"][i]["ciudad"],
        codigo: data["datos"][i]["codigo"],
        coordinador: data["datos"][i]["coordinador"],
        lat: data["datos"][i]["lat"],
        lng: data["datos"][i]["lng"],
        telefono: data["datos"][i]["telefono"],
        edificio: data["datos"][i]["edificio"],
      ));
    }

    return listServicios;
  }
}
