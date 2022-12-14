import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Reportar_SituacioModel.dart';
import '../Services/ReportarSituacion_Api.dart';
import '../widget/Card/MisSituaciones.dart';
import 'DetailsReporteSituaciones.dart';
import 'main_Drawer.dart';

class MisSituaciones extends StatefulWidget {
  const MisSituaciones({super.key});
  static String routeName = "/misSituaciones";

  @override
  State<MisSituaciones> createState() => _MisSituacionesState();
}

class _MisSituacionesState extends State<MisSituaciones> {
  Future<List<Reportar_Situacionmodel>>? listSituaciones;
  List<Reportar_Situacionmodel>? list;
  bool isExist = true;
  @override
  void initState() {
    listSituaciones = ReportarSituacion_Api.GetMySituation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: MainDrawe(),
        drawer: const MainDrawe(),
        appBar: AppBar(
          title: const Text("Mis situaciones"),
        ),
        body: FutureBuilder<List<Reportar_Situacionmodel>>(
            future: listSituaciones,
            builder: (context, snapshot) {
              List<Widget> list = [];
              if (snapshot.data != null && (snapshot.data?.length)! > 0) {
                for (Reportar_Situacionmodel item in snapshot.data ?? []) {
                  list.add(
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsReporteSituaciones(
                                        Titulo: item.Titulo,
                                        Foto: item.Foto,
                                        Latitud: item.Latitud,
                                        Longitud: item.Longitud,
                                        Descripcion: item.Descripcion,
                                        Estado: item.Estado,
                                        Fecha: item.Fecha,
                                      )));
                        },
                        child: MisSituaciones_Widget(
                          item.Foto,
                          item.Titulo,
                        )),
                  );
                }
                return ListView(shrinkWrap: true, children: list);
              }
              Future.delayed(const Duration(seconds: 30), () {
                setState(() {
                  isExist = false;
                });
              });
              return Center(
                  child: isExist
                      ? const CircularProgressIndicator()
                      : const Text(
                          "No hay situaciones",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ));
            }));
  }
}
