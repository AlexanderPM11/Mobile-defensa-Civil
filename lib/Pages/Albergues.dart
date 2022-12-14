import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Models/Albergue.dart';
import 'package:project_final/Pages/main_Drawer.dart';

import '../Services/Alburgue_Api.dart';
import '../widget/Card/Card_general.dart';
import 'Details_Albergue.dart';

class Albergues extends StatefulWidget {
  const Albergues({super.key});
  static String routeName = "/albergues";

  @override
  State<Albergues> createState() => _AlberguesState();
}

class _AlberguesState extends State<Albergues> {
  bool _isSearching = false;
  bool loading = true;
  TextEditingController searchController = TextEditingController();
  Future<List<Albergue>>? listAlbergues;
  List<Albergue>? list;
  @override
  void initState() {
    listAlbergues = Albergue_Api.GetAlbergue();
    super.initState();
  }

  Future<List<Albergue>> filterAlb(String filter) async {
    List<Albergue> listServicios = [];
    list = await Albergue_Api.GetAlbergue();
    Iterable<Albergue>? listFisterAlb =
        list?.where((element) => element.edificio.contains(filter));
    if (listAlbergues != null) {
      setState(() {
        loading = false;
      });
    }
    for (var item in listFisterAlb!) {
      listServicios.add(item);
    }

    return listServicios;
  }

  //changeState_isSearching
  void searching() {
    setState(() {
      _isSearching = true;
      listAlbergues = filterAlb(searchController.text);
      loading = true;
    });
  }

  void cancelSearch() {
    setState(() {
      _isSearching = false;
      loading = false;
      searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: MainDrawe(),
        drawer: const MainDrawe(),
        appBar: AppBar(
          actions: [
            !_isSearching
                ? IconButton(
                    onPressed: searching,
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      cancelSearch();
                    }),
          ],
          title: !_isSearching
              ? const Text("Listado de Albergues")
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: TextField(
                    controller: searchController,
                    onChanged: ((value) => {searching()}),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    autofocus: true,
                    onEditingComplete: (() => print("Fiis")),
                    decoration: InputDecoration(
                      suffix: loading
                          ? const SizedBox(
                              height: 10,
                              width: 10,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : null,
                      hintText: "Nombre de albergues",
                      hintStyle: const TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
        ),
        body: FutureBuilder<List<Albergue>>(
            future: listAlbergues,
            builder: (context, snapshot) {
              List<Widget> list = [];
              if (snapshot.hasData) {
                for (Albergue item in snapshot.data ?? []) {
                  list.add(
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details_Albergues(
                                        coordinador: item.coordinador,
                                        telefono: item.telefono,
                                        ciudad: item.ciudad,
                                        codigo: item.codigo,
                                        edificio: item.edificio,
                                        lat: item.lat,
                                        lng: item.lng,
                                        capacidad: item.capacidad,
                                      )));
                        },
                        child: Card_General('./assets/albergues.jpg',
                            item.edificio, "\n(${item.ciudad})",
                            isLocalImage: true, height: 100)),
                  );
                }
                return ListView(shrinkWrap: true, children: list);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
