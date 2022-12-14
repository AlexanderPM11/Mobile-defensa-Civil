import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details_Albergues extends StatefulWidget {
  String ciudad;
  String codigo;
  String edificio;
  String coordinador;
  String telefono;
  String capacidad;
  String lng;
  String lat;
  Details_Albergues(
      {Key? key,
      required this.coordinador,
      required this.telefono,
      required this.ciudad,
      required this.edificio,
      required this.capacidad,
      required this.codigo,
      required this.lng,
      required this.lat})
      : super(key: key);

  @override
  State<Details_Albergues> createState() => _Details_AlberguesState(
      codigo: this.codigo,
      telefono: this.telefono,
      ciudad: this.ciudad,
      edificio: this.edificio,
      capacidad: this.capacidad,
      lat: this.lat,
      lng: this.lat,
      coordinador: this.coordinador);
}

class _Details_AlberguesState extends State<Details_Albergues> {
  String ciudad;
  String codigo;
  String edificio;
  String coordinador;
  String telefono;
  String capacidad;
  String lng;
  String lat;
  _Details_AlberguesState(
      {required this.coordinador,
      required this.telefono,
      required this.ciudad,
      required this.edificio,
      required this.capacidad,
      required this.codigo,
      required this.lng,
      required this.lat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Albergue")),
        body: Scrollbar(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: const Center(
                    child: Text(
                  "Detalles Albergue",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              Card(
                  margin: const EdgeInsets.all(20),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Image.asset(
                          './assets/albergues.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Center(
                              child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Color.fromARGB(255, 14, 14, 14),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "\n\nCiudad",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                TextSpan(text: "\n$ciudad"),
                                TextSpan(
                                    text: "\n\nCodigo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                TextSpan(text: "\n$codigo"),
                                TextSpan(
                                  text: "\n\nEdificio",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$edificio"),
                                TextSpan(
                                  text: "\n\nCoordinador",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$coordinador"),
                                TextSpan(
                                  text: "\n\nTelefono",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$telefono"),
                                TextSpan(
                                  text: "\n\nCapacidad",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$capacidad"),
                                TextSpan(
                                  text: "\n\nLatitud",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$lat"),
                                TextSpan(
                                  text: "\n\nLongitud",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "\n$lng"),
                              ],
                            ),
                          )))
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget testHeading(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
