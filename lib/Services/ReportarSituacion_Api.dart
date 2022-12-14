// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_final/Models/Miembro.dart';
import 'package:project_final/util/Response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/MapaSituacion.dart';
import '../Models/Reportar_SituacioModel.dart';

// ignore: camel_case_types
class ReportarSituacion_Api {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  static Future<Response_Api> ReportarSituacion(String titulo,
      String descripcion, String foto, String latitud, String longitud) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    Response_Api responseApi = Response_Api(mensage: "", result: true);
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/nueva_situacion.php"),
        body: {
          'titulo': titulo,
          'descripcion': descripcion,
          'foto': foto,
          'latitud': latitud,
          'longitud': longitud,
          'token': token
        });
    Map data = jsonDecode(response.body);
    responseApi.mensage = data["mensaje"];
    responseApi.result = data["exito"];

    return responseApi;
  }

  static Future<List<Reportar_Situacionmodel>> GetMySituation() async {
    Response_Api responseApi = Response_Api(mensage: "", result: true);
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    List<Reportar_Situacionmodel> listServicios = [];
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/situaciones.php"),
        body: {'token': token});
    Map data = jsonDecode(response.body);
    for (var i = 0; i < data["datos"].length; i++) {
      listServicios.add(Reportar_Situacionmodel(
          Descripcion: data["datos"][i]["descripcion"],
          Latitud: data["datos"][i]["latitud"],
          Titulo: data["datos"][i]["titulo"],
          Foto: data["datos"][i]["foto"],
          Longitud: data["datos"][i]["longitud"],
          Estado: data["datos"][i]["estado"],
          Fecha: data["datos"][i]["fecha"]));
    }
    return listServicios;
  }

  static Future<List<MapaSituaciones>> GetLongLatSituacion() async {
    List<MapaSituaciones> listMapLongLat = [];
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/situaciones.php"),
        body: {'token': token});
    Map data = jsonDecode(response.body);
    print(data);
    for (var i = 0; i < data["datos"].length; i++) {
      listMapLongLat.add(MapaSituaciones(
          lant: data["datos"][i]["latitud"],
          long: data["datos"][i]["latitud"]));
    }
    return listMapLongLat;
  }
}
