import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_final/Services/Voluntatio_Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../util/Response.dart';
import 'login.dart';
import 'main_Drawer.dart';

class RecuperarContrasena extends StatefulWidget {
  const RecuperarContrasena({super.key});

  @override
  State<RecuperarContrasena> createState() => RecuperarContrasenaState();
}

class RecuperarContrasenaState extends State<RecuperarContrasena> {
  static String routeName = "/RecuperarContrasena";
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controlleCedula = TextEditingController();
  Response_Api? responseApi;
  bool sending = false;

  Future<void> cambiarClave() async {
    String cedula = controlleCedula.text;
    String correo = controllerCorreo.text;
    responseApi = await Voluntario_Api.Recuperar_Clave(cedula, correo);
  }

  void clearInput() {
    controllerCorreo.clear();
    controlleCedula.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawe(),
        appBar: AppBar(title: Text("Recuperar Contaseña")),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/forgotPass.png",
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: controlleCedula,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Cedula",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        value = value.toString().trim();
                        if (value.isEmpty) {
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
                      controller: controllerCorreo,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Correo",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        value = value.toString().trim();
                        if (value.isEmpty) {
                          return 'Introduzca el correo';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                              width: 2, color: Color(0xff004C98))),
                      onPressed: sending
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  sending = true;
                                });
                                await cambiarClave();

                                if (responseApi!.result) {
                                  clearInput();
                                  Alert_Dialog("Exito", responseApi!.mensage,
                                      DialogType.success);
                                  setState(() {
                                    sending = false;
                                  });
                                } else {
                                  Alert_Dialog("Error", responseApi!.mensage,
                                      DialogType.error,
                                      error: true);
                                  setState(() {
                                    sending = false;
                                  });
                                }
                              }
                            },
                      icon: sending
                          ? const SizedBox(
                              height: 10,
                              width: 10,
                              child: CircularProgressIndicator(),
                            )
                          : const Icon(Icons.get_app),
                      label: sending
                          ? const Text("Recuperando..")
                          : const Text("Recuperar"),
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
          Navigator.of(context).pushReplacementNamed(Login.routeName);
        }
      },
    )..show();
  }
}
