import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_final/Pages/CambiarPass.dart';
import 'package:project_final/Pages/Noticias.dart';
import 'package:project_final/Pages/RecuperarContrasena.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Voluntario.dart';
import '../Services/Voluntatio_Api.dart';
import '../main.dart';
import '../util/Response.dart';
import '../util/ResponseUserLogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String routeName = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  ResponseUserLogin? responseApi;
  TextEditingController controllerCedula = new TextEditingController();
  TextEditingController controllerClave = new TextEditingController();
  bool isSending = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> Login() async {
    String cedula = controllerCedula.text;
    String clave = controllerClave.text;
    responseApi = await Voluntario_Api.Iniciar_Sesion(cedula, clave);
    if (responseApi!.result) {
      Map<String, dynamic> map = {
        'nombre': responseApi!.nombre,
        'apellido': responseApi!.appelido,
        'correo': responseApi!.correo,
        'token': responseApi!.token
      };
      String rawJson = jsonEncode(map);
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userLogin', rawJson);
      await prefs.setString('token', responseApi!.token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawe(),
        appBar: AppBar(title: const Text("Login")),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/historia_img.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: controllerCedula,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Cedula",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca la cedula';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                      controller: controllerClave,
                      obscureText: true,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Clave",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca la clave';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                        RecuperarContrasenaState.routeName),
                    child: const Text(
                      "¿Olvido su contraseña?",
                      style: TextStyle(
                          color: Color(0xff004C98),
                          fontWeight: FontWeight.normal),
                    ),
                  )),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    width: 200,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                              width: 2, color: Color(0xff004C98))),
                      onPressed: isSending
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isSending = true;
                                });
                                await Login();

                                if (responseApi!.result) {
                                  Alert_Dialog("Exito", responseApi!.mensage,
                                      DialogType.success);
                                  setState(() {
                                    isSending = false;
                                  });
                                } else {
                                  Alert_Dialog("Error", responseApi!.mensage,
                                      DialogType.error,
                                      error: true);
                                  setState(() {
                                    isSending = false;
                                  });
                                }
                              }
                            },
                      icon: isSending
                          ? const SizedBox(
                              height: 10,
                              width: 10,
                              child: CircularProgressIndicator(),
                            )
                          : const Icon(Icons.login),
                      label: isSending
                          ? const Text(
                              "Loging....",
                              style: TextStyle(color: Color(0xffFF7000)),
                            )
                          : Text("Login"),
                    ),
                  )
                ]),
              ],
            )));
  }

  AwesomeDialog Alert_Dialog(String _desc, String _title, DialogType dialogType,
      {bool error = false}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: _desc,
      desc: _title,
      descTextStyle: error ? TextStyle(color: Colors.red) : null,
      //btnCancelOnPress: () {},
      btnOkOnPress: () {
        if (!error) {
          Navigator.of(context).pushReplacementNamed(Noticias.routeName);
        }
      },
    )..show();
  }
}
