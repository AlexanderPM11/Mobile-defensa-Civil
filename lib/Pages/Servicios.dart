import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Models/Servicios.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import '../Services/Servicios_Api.dart';
import '../widget/Card/Card_general.dart';

class Servicio extends StatefulWidget {
  const Servicio({super.key});
  static String routeName = "/servicios";
  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  Future<List<Servicios>>? listServicios;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      listServicios = Servicios_Api.GetNoticia();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Servicios")),
        drawer: MainDrawe(),
        body: FutureBuilder<List<Servicios>>(
            future: listServicios,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> list = [];
                for (Servicios item in snapshot.data ?? []) {
                  list.add(
                      Card_General(item.Foto, item.Nombre, item.Descripcion));
                }
                return ListView(shrinkWrap: true, children: list);
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}
