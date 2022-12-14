import 'package:flutter/material.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import '../Models/Noticia.dart';
import '../Services/Noticia_Api.dart';
import '../widget/Card/Card_general.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});
  static String routeName = "/noticias";

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  Future<List<Noticia>>? listNoticias;

  @override
  void initState() {
    setState(() {
      listNoticias = Noticia_Api.GetNoticia();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Noticias")),
        drawer: MainDrawe(),
        body: FutureBuilder<List<Noticia>>(
            future: listNoticias,
            builder: (context, snapshot) {
              print(snapshot.hasData);
              List<Widget> list = [];
              if (snapshot.hasData) {
                for (Noticia item in snapshot.data ?? []) {
                  list.add(
                      Card_General(item.Foto, item.Titulo, item.Contenido));
                }
                return ListView(shrinkWrap: true, children: list);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
