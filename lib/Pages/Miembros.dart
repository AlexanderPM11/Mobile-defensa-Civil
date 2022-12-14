import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Models/Miembro.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:project_final/widget/Card/Card_general.dart';

import '../Services/Alburgue_Api copy.dart';
import 'Details_Albergue.dart';
import 'MedidasPreventivasDetails.dart';

class Miembros extends StatefulWidget {
  const Miembros({super.key});
  static const routeName = "/miembros";

  @override
  State<Miembros> createState() => _MiembrosState();
}

class _MiembrosState extends State<Miembros> {
  Future<List<Miembro_Model>>? listMiembro_Models;
  @override
  void initState() {
    listMiembro_Models = Miembro_Api.GetMiembro_Model();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawe(),
        appBar: AppBar(
          title: Text("Miembros"),
        ),
        body: FutureBuilder<List<Miembro_Model>>(
            future: listMiembro_Models,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> list = [];
                for (Miembro_Model item in snapshot.data ?? []) {
                  list.add(Card_General(
                      item.Foto, (item.Nombre), "(${item.Cargo})"));
                }
                return ListView(children: list);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
