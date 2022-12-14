import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_final/Models/Miembro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Voluntario.dart';
import '../util/Response.dart';
import '../util/ResponseUserLogin.dart';

class Voluntario_Api {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  static Future<Response_Api> Registro_Voluntario(String cedula, String nombre,
      String apellido, String telefono, String clave, String correo) async {
    Response_Api response_api = Response_Api(mensage: "", result: true);
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/registro.php"),
        body: {
          'cedula': cedula,
          'nombre': nombre,
          'apellido': apellido,
          'telefono': telefono,
          'clave': clave,
          'correo': correo,
        });
    Map data = jsonDecode(response.body);

    response_api.mensage = data["mensaje"];
    response_api.result = data["exito"];
    return response_api;
  }

  static Future<ResponseUserLogin> Iniciar_Sesion(
      String cedula, String clave) async {
    ResponseUserLogin responseApi = new ResponseUserLogin();
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/iniciar_sesion.php"),
        body: {'cedula': cedula, 'clave': clave});
    Map data = jsonDecode(response.body);
    if (data["exito"]) {
      responseApi.nombre = data["datos"]["nombre"];
      responseApi.appelido = data["datos"]["apellido"];
      responseApi.correo = data["datos"]["correo"];
      responseApi.token = data["datos"]["token"];
    }
    responseApi.result = data["exito"];
    responseApi.mensage = data["mensaje"];
    return responseApi;
  }

  static Future<Response_Api> Cambiar_Clave(
      String claveAnterior, String claveNueva) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    Response_Api responseApi = Response_Api(mensage: "", result: true);
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/cambiar_clave.php"),
        body: {
          'token': token,
          'clave_anterior': claveAnterior,
          'clave_nueva': claveNueva
        });
    Map data = jsonDecode(response.body);
    responseApi.mensage = data["mensaje"];
    responseApi.result = data["exito"];
    return responseApi;
  }

  static Future<Response_Api> Recuperar_Clave(
      String cedula, String correo) async {
    Response_Api responseApi = Response_Api(mensage: "", result: true);
    http.Response response = await http.post(
        Uri.parse("https://adamix.net/defensa_civil/def/recuperar_clave.php"),
        body: {'cedula': cedula, 'correo': correo});
    Map data = jsonDecode(response.body);
    responseApi.mensage = data["mensaje"];
    responseApi.result = data["exito"];
    return responseApi;
  }
}
