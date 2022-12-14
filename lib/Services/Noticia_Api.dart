import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Noticia.dart';

class Noticia_Api {
  static Future<List<Noticia>> GetNoticia() async {
    List<Noticia> listServicios = [];
    http.Response response = await http
        .get(Uri.parse("https://adamix.net/defensa_civil/def/noticias.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Noticia(
          Fecha: data["datos"][i]["fecha"],
          Titulo: data["datos"][i]["titulo"],
          Foto: data["datos"][i]["foto"],
          Contenido: data["datos"][i]["contenido"],
          Id: int.parse(data["datos"][i]["id"])));
    }

    return listServicios;
  }
}
