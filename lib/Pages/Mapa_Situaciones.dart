import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:project_final/Pages/main_Drawer.dart';

import '../Models/Albergue.dart';
import '../Models/MapaSituacion.dart';
import '../Models/Reportar_SituacioModel.dart';
import '../Services/Alburgue_Api.dart';
import '../Services/ReportarSituacion_Api.dart';
import 'Map.dart';

class MapaSituaciones extends StatefulWidget {
  const MapaSituaciones({super.key});

  @override
  State<MapaSituaciones> createState() => MapaSituacionesState();
}

class MapaSituacionesState extends State<MapaSituaciones> {
  static String routeName = "/mapSituaciones";
  Future<List<Reportar_Situacionmodel>>? listReportar_Situacionmodels;
  List<Reportar_Situacionmodel>? listSituacion;
  @override
  void initState() {
    listReportar_Situacionmodels = ReportarSituacion_Api.GetMySituation();
    super.initState();
  }

  var rng = Random();

  Color ranfoColors() {
    List<Color> listColor = [
      Colors.red,
      Colors.black,
      Colors.green,
      Colors.yellow,
      Colors.pink,
      Colors.blue,
      Colors.brown,
      Colors.orange,
      Colors.purple,
      Colors.redAccent,
      Colors.grey,
      Colors.deepPurple,
      Colors.yellowAccent,
      Colors.purpleAccent,
      Colors.lime,
      Colors.purpleAccent
    ];
    return listColor[rng.nextInt(listColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawe(),
        appBar: AppBar(
          title: const Text("Mis Situaciones"),
        ),
        body: FutureBuilder<List<Reportar_Situacionmodel>>(
            future: listReportar_Situacionmodels,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Flexible(
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(19.0296123, -71.5031591),
                          zoom: 7,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              for (Reportar_Situacionmodel item
                                  in snapshot.data ?? [])
                                Marker(
                                    point: LatLng(
                                        double.tryParse(item.Latitud) ?? 0,
                                        double.tryParse(item.Longitud) ?? 0),
                                    width: 80,
                                    height: 80,
                                    builder: (context) => TextButton(
                                        onPressed: () => Alert_Dialog(
                                              item.Titulo,
                                              item.Descripcion,
                                              DialogType.info,
                                              item.Foto,
                                            ),
                                        child: Icon(
                                          Icons.location_on,
                                          color: ranfoColors(),
                                        ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  AwesomeDialog Alert_Dialog(
      String _desc, String _title, DialogType dialogType, String image,
      {bool error = false}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: _desc,
      body: Column(children: [
        Text(
          _desc,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            )),
        Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            _title.substring(0, 200) + "....",
            textAlign: TextAlign.justify,
          ),
        )
      ]),

      //btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
