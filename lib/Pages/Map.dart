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
import '../Services/Alburgue_Api.dart';

class MapDetails extends StatefulWidget {
  // String name;
  // String lastname;
  // String lat;
  // String log;
  static String routeName = "/mapDetails";

  MapDetails({Key? key}) : super(key: key);

  @override
  State<MapDetails> createState() => _nameState();
}

class _nameState extends State<MapDetails> {
  Future<List<Albergue>>? listAlbergues;
  List<Albergue>? list;
  @override
  void initState() {
    listAlbergues = Albergue_Api.GetAlbergue();
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
          title: const Text("Map"),
        ),
        body: FutureBuilder<List<Albergue>>(
            future: listAlbergues,
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
                              for (Albergue item in snapshot.data ?? [])
                                Marker(
                                    point: LatLng(double.parse(item.lng),
                                        double.parse(item.lat)),
                                    width: 80,
                                    height: 80,
                                    builder: (context) => TextButton(
                                        onPressed: () {
                                          Alert_Dialog(
                                              item.edificio,
                                              item.ciudad,
                                              item.capacidad,
                                              item.coordinador,
                                              item.telefono,
                                              DialogType.info,
                                              "./assets/albergues.jpg");
                                        },
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
      String _title,
      String _ubicacion,
      String _capacidad,
      String cordinador,
      String _numero,
      DialogType dialogType,
      String image,
      {bool error = false}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: _title,
      body: Container(
          child: Column(children: [
        Text(
          _title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            )),
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            "Este albergue esta ubicado en $_ubicacion, el mismo tiene una capacidad hasta de $_capacidad. Para ponerse en contacto con el Codinador/a: $cordinador, puede marcar el siguiente número telefonico: $_numero",
            textAlign: TextAlign.justify,
          ),
        )
      ])),

      //btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
