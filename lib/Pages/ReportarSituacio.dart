// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:project_final/main.dart';

import '../Services/ReportarSituacion_Api.dart';
import '../Services/Voluntatio_Api.dart';
import '../util/Response.dart';

class ReportarSituacio extends StatefulWidget {
  const ReportarSituacio({super.key});
  static const routeName = "/reportarSituacio";
  @override
  State<ReportarSituacio> createState() => _ReportarSituacioState();
}

class _ReportarSituacioState extends State<ReportarSituacio> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerdescripcion = TextEditingController();
  TextEditingController controllerFoto = TextEditingController();
  TextEditingController controllerLatitud = TextEditingController();
  TextEditingController controllerLongitud = TextEditingController();

  Response_Api? response_api;
  bool sending = false;
  bool isReady = false;
  bool selectedImga = false;
  late String foto = "";

  Future<void> register_Volutario() async {
    String titulo = controllerTitulo.text;
    String descripcion = controllerdescripcion.text;
    String latitud = controllerLatitud.text;
    String longitud = controllerLongitud.text;
    await saveImage();
    response_api = await ReportarSituacion_Api.ReportarSituacion(
        titulo, descripcion, foto, latitud, longitud);
    setState(() {
      sending = false;
    });
  }

  late Uint8List memoryPhoto;
  late Uint8List ss;
  late XFile? image;

  void clearInput() {
    controllerTitulo.clear();
    controllerdescripcion.clear();
    controllerFoto.clear();
    controllerFoto.clear();
    controllerLatitud.clear();
    controllerLongitud.clear();
  }

  Future<void> saveImage() async {
    final cloudinary = Cloudinary.signedConfig(
      apiKey: "335784644844121",
      apiSecret: "CVlFHsxVjbkH87ZUt_rd6_bVsVU",
      cloudName: "dlffqupc9",
    );
    List<int>? imagebytes = await image?.readAsBytes();
    final response = await cloudinary.upload(
      file: image?.path,
      fileBytes: imagebytes,
      resourceType: CloudinaryResourceType.image,
      folder: "myImg",
      fileName: 'some-name',
    );
    if (response.isSuccessful) {
      setState(() {
        foto = response.secureUrl!;
      });
    }
  }

  //

  File? _imageFile; // picked image will be store here.
  final ImagePicker _picker = ImagePicker();
  void _pickImageBase64() async {
    try {
      image = await _picker.pickImage(
          source: ImageSource.gallery, requestFullMetadata: false);
      if (image == null) return;
      // read picked image byte data.

      final imageTemp = File(image!.path);
      setState(() {
        // ignore: unnecessary_this
        selectedImga = true;
        this._imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawe(),
      appBar: AppBar(
        title: const Text("Reportar situacion"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Image.asset(
            "assets/problem_Situacion.png",
            width: 200,
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              controller: controllerTitulo,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Titulo",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca un titulo';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(500),
              ],
              minLines: 2,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              controller: controllerdescripcion,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Descripcion",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca una descripcion para su noticia';
                }
                return null;
              },
            ),
          ),
          _imageFile == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      _imageFile!,
                      fit: BoxFit.fill,
                    ),
                  )),
          Container(
            padding: const EdgeInsets.all(10),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 2, color: Color(0xff004C98))),
              onPressed: () => _pickImageBase64(),
              label: const Text("Seleccionar imagen.."),
              icon: Icon(Icons.image),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(13),
              ],
              controller: controllerLatitud,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Latitud",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca la latitud';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(13),
              ],
              controller: controllerLongitud,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff004C98), width: 2)),
                labelText: "Longitud",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value.toString().trim();
                if (value.isEmpty) {
                  return 'Introduzca su longitud';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 2, color: Color(0xff004C98))),
              onPressed: sending
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        if (!selectedImga) {
                          Alert_Dialog(
                              "Error",
                              "Por favor seleccione una foto antes de enviar",
                              DialogType.error,
                              error: true);
                        } else {
                          setState(() {
                            sending = true;
                          });
                          await register_Volutario();

                          if (response_api!.result) {
                            _imageFile = null;
                            foto = "";
                            clearInput();
                            Alert_Dialog("Exito", response_api!.mensage,
                                DialogType.success);
                            setState(() {
                              sending = false;
                            });
                          } else {
                            Alert_Dialog("Error", response_api!.mensage,
                                DialogType.error,
                                error: true);
                            setState(() {
                              sending = false;
                            });
                          }
                        }
                      }
                    },
              icon: sending
                  ? const SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.save_alt),
              label: sending ? const Text("Guardando") : const Text("Guardar"),
            ),
          ),
        ]),
      ),
    );
  }

  AwesomeDialog Alert_Dialog(String desc, String title, DialogType dialogType,
      {bool error = false}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: desc,
      desc: title,
      descTextStyle: error ? TextStyle(color: Colors.red) : null,
      //btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
