import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Card/MisSituaciones.dart';

class DetailsReporteSituaciones extends StatefulWidget {
  String Titulo;
  String Descripcion;
  String Foto;
  String Latitud;
  String Longitud;
  String Estado;
  String Fecha;

  DetailsReporteSituaciones({
    Key? key,
    required this.Titulo,
    required this.Descripcion,
    required this.Foto,
    required this.Latitud,
    required this.Longitud,
    required this.Estado,
    required this.Fecha,
  }) : super(key: key);

  @override
  State<DetailsReporteSituaciones> createState() =>
      _DetailsReporteSituacionesState(
        Titulo: this.Titulo,
        Descripcion: this.Descripcion,
        Foto: this.Foto,
        Latitud: this.Latitud,
        Longitud: this.Longitud,
        Estado: this.Estado,
        Fecha: this.Fecha,
      );
}

class _DetailsReporteSituacionesState extends State<DetailsReporteSituaciones> {
  String Titulo;
  String Descripcion;
  String Foto;
  String Latitud;
  String Longitud;
  String Estado;
  String Fecha;
  _DetailsReporteSituacionesState(
      {required this.Titulo,
      required this.Descripcion,
      required this.Foto,
      required this.Latitud,
      required this.Longitud,
      required this.Fecha,
      required this.Estado});
  @override
  void initState() {
    print(Foto);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detalle del Reporte")),
        body: Scrollbar(
          child: ListView(
            shrinkWrap: true,
            children: [
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
                      MisSituaciones_Widget(Foto, Titulo,
                          Descripcion: Descripcion,
                          fecha: Fecha,
                          showEstado: true,
                          Estado: Estado)
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget testHeading(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
