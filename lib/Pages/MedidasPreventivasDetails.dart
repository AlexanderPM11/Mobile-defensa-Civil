import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Card/Card_general.dart';

class MedidasPreventivasDetail extends StatefulWidget {
  String Titulo;
  String Descripcion;
  MedidasPreventivasDetail({
    Key? key,
    required this.Titulo,
    required this.Descripcion,
  }) : super(key: key);

  @override
  State<MedidasPreventivasDetail> createState() =>
      _MedidasPreventivasDetailState(
          Titulo: this.Titulo, Descripcion: this.Descripcion);
}

class _MedidasPreventivasDetailState extends State<MedidasPreventivasDetail> {
  String Titulo;
  String Descripcion;
  _MedidasPreventivasDetailState(
      {required this.Titulo, required this.Descripcion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles Medida Preventiva"),
      ),
      body: Scrollbar(
          child: ListView(
        shrinkWrap: true,
        children: [
          Card_General("./assets/warning.png", Titulo, Descripcion,
              isLocalImage: true, height: 150, width: 150)
        ],
      )),
    );
  }
}
