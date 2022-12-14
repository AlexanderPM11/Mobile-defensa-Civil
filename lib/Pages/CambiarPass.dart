import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_final/Pages/login.dart';
import 'package:project_final/Services/Voluntatio_Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../util/Response.dart';
import '../util/logOut.dart';
import 'main_Drawer.dart';

class CambiarPass extends StatefulWidget {
  const CambiarPass({super.key});

  @override
  State<CambiarPass> createState() => CambiarPassState();
}

class CambiarPassState extends State<CambiarPass> {
  static String routeName = "/cambiarPass";
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerClaveAnterior = TextEditingController();
  TextEditingController controllerClaveNueva = TextEditingController();
  Response_Api? responseApi;
  bool sending = false;

  Future<void> cambiarClave() async {
    String claveAnterior = controllerClaveAnterior.text;
    String claveNueva = controllerClaveNueva.text;
    responseApi = await Voluntario_Api.Cambiar_Clave(claveAnterior, claveNueva);
  }

  void clearInput() {
    controllerClaveAnterior.clear();
    controllerClaveNueva.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawe(),
        appBar: AppBar(title: Text("Cambiar Contaseña")),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/changePass.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                      controller: controllerClaveAnterior,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Clave anterior",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        value = value.toString().trim();
                        if (value.isEmpty) {
                          return 'Introduzca Clave anterior';
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
                      controller: controllerClaveNueva,
                      obscureText: true,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff004C98), width: 2)),
                        labelText: "Clave nueva",
                        border: OutlineInputBorder(),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        value = value.toString().trim();
                        if (value.isEmpty) {
                          return 'Introduzca la Clave nueva';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 330,
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
                                  Alert_Dialog(
                                      "Exito",
                                      "${responseApi!.mensage}\n\nAhora haga el proceso de login otra vez",
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
                          : const Icon(Icons.change_circle_outlined),
                      label: sending
                          ? const Text("Cambiando..")
                          : const Text("Cambiar"),
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
      btnOkOnPress: () async {
        if (!error) {
          await logOut.logout();
          Navigator.of(context).pushReplacementNamed(Login.routeName);
        }
      },
    )..show();
  }
}
