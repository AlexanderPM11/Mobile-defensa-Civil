import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Servicios.dart';

class Servicios_Api {
  static Future<List<Servicios>> GetNoticia() async {
    List<Servicios> listServicios = [];
    http.Response response = await http
        .get(Uri.parse("https://adamix.net/defensa_civil/def/servicios.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Servicios(
          Nombre: data["datos"][i]["nombre"],
          Foto: data["datos"][i]["foto"],
          Descripcion: data["datos"][i]["descripcion"],
          Id: int.parse(data["datos"][i]["id"])));
    }
    return listServicios;
  }
}
