import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_final/Pages/login.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:project_final/main.dart';

import '../Services/Voluntatio_Api.dart';
import '../util/Response.dart';

class FormQuieroVoluntario extends StatefulWidget {
  const FormQuieroVoluntario({super.key});
  static const routeName = "/quieroSerVoluntario";
  @override
  State<FormQuieroVoluntario> createState() => _FormQuieroVoluntarioState();
}

class _FormQuieroVoluntarioState extends State<FormQuieroVoluntario> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerCedula = TextEditingController();
  TextEditingController controllerTelefono = TextEditingController();
  TextEditingController controllerClave = TextEditingController();

  Response_Api? response_api;
  bool sending = false;
  bool notSaved = false;
  String error = "";

  Future<void> register_Volutario() async {
    String cedula = controllerCedula.text;
    String nombre = controllerNombre.text;
    String correo = controllerCorreo.text;
    String clave = controllerClave.text;
    String telefono = controllerTelefono.text;
    String apellido = controllerApellido.text;

    response_api = await Voluntario_Api.Registro_Voluntario(
        cedula, nombre, apellido, telefono, clave, correo);
    setState(() {
      sending = false;
    });
  }

  void clearInput() {
    controllerCedula.clear();
    controllerNombre.clear();
    controllerCorreo.clear();
    controllerClave.clear();
    controllerTelefono.clear();
    controllerApellido.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawe(),
      appBar: AppBar(
        title: const Text("Solicitud de voluntario"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Image.asset(
            "assets/historia_img.png",
            width: 200,
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              controller: controllerNombre,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduzca su nombre';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(150),
              ],
              controller: controllerApellido,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Apellido",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca su apellido';
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
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Correo",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca su correo';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              controller: controllerTelefono,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Telefono",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca su telefono';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
              ],
              controller: controllerCedula,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Cedula",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca su cedula';
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
              obscureText: true,
              controller: controllerClave,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Clave",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca la clave';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 2, color: Color(0xff004C98))),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    sending = true;
                  });
                  await register_Volutario();

                  if (response_api!.result) {
                    clearInput();
                    Alert_Dialog(
                        "Exito", response_api!.mensage, DialogType.success);
                    setState(() {
                      sending = false;
                    });
                  } else {
                    Alert_Dialog(
                        "Error", response_api!.mensage, DialogType.error,
                        error: true);
                    setState(() {
                      sending = false;
                      notSaved = true;
                      error = response_api!.mensage;
                    });
                  }
                }
              },
              icon: sending
                  ? const SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.save_alt),
              label: sending ? const Text("Guardando") : const Text("Guardar"),
            ),
          )
        ]),
      ),
    );
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
        Navigator.of(context).pushReplacementNamed(Login.routeName);
      },
    )..show();
  }
}
