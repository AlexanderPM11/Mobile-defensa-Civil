import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Noticia.dart';
import '../Models/Video.dart';

class Video_Api {
  static Future<List<Video_Model>> GetVideo() async {
    List<Video_Model> listServicios = [];
    http.Response response = await http
        .get(Uri.parse("https://adamix.net/defensa_civil/def/videos.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Video_Model(
          Fecha: data["datos"][i]["fecha"],
          Titulo: data["datos"][i]["titulo"],
          link: data["datos"][i]["link"],
          Descripcion: data["datos"][i]["descripcion"] != null
              ? data["datos"][i]["descripcion"]
              : "Defensa Civíl",
          Id: int.parse(data["datos"][i]["id"])));
    }

    return listServicios;
  }
}
