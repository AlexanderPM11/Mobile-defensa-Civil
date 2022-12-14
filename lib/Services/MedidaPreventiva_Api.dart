import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_final/Models/MedidaPreventiva.dart';

import '../Models/Albergue.dart';
import '../Models/Noticia.dart';

class MedidaPreventiva_Api {
  static Future<List<MedidaPreventiva>> GetMedidaPreventiva() async {
    List<MedidaPreventiva> listServicios = [];
    http.Response response = await http.get(Uri.parse(
        "https://adamix.net/defensa_civil/def/medidas_preventivas.php"));
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(MedidaPreventiva(
          Titulo: data["datos"][i]["titulo"],
          Descripcion: data["datos"][i]["descripcion"]));
    }

    return listServicios;
  }
}
