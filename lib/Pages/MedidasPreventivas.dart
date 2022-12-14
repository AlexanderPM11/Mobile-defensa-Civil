import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/main_Drawer.dart';

import '../Models/MedidaPreventiva.dart';
import '../Services/MedidaPreventiva_Api.dart';
import '../widget/Card/Card_general.dart';
import 'Details_Albergue.dart';
import 'MedidasPreventivasDetails.dart';

class MedidasPreventivas extends StatefulWidget {
  const MedidasPreventivas({super.key});
  static const routeName = "/medidasPreventivas";

  @override
  State<MedidasPreventivas> createState() => _MedidasPreventivasState();
}

class _MedidasPreventivasState extends State<MedidasPreventivas> {
  Future<List<MedidaPreventiva>>? listMedidaPreventivas;
  List<MedidaPreventiva>? list;
  @override
  void initState() {
    listMedidaPreventivas = MedidaPreventiva_Api.GetMedidaPreventiva();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  //changeState_isSearching

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawe(),
        appBar: AppBar(
          title: Text("Medidas preventivas"),
        ),
        body: FutureBuilder<List<MedidaPreventiva>>(
            future: listMedidaPreventivas,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> list = [];

                for (MedidaPreventiva item in snapshot.data ?? []) {
                  list.add(GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedidasPreventivasDetail(
                                    Titulo: item.Titulo,
                                    Descripcion: item.Descripcion,
                                  )));
                    },
                    child: Card_General("./assets/warning.png", item.Titulo, "",
                        isLocalImage: true, height: 150, width: 150),
                  ));
                }

                return ListView(
                  children: list,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
