import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/AboutMe.dart';
import 'package:project_final/Pages/Albergues.dart';
import 'package:project_final/Pages/Historia.dart';
import 'package:project_final/Pages/Inicio.dart';
import 'package:project_final/Pages/Map.dart';
import 'package:project_final/Pages/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/Form_QuieroVoluntario.dart';
import '../Pages/MedidasPreventivas.dart';
import '../Pages/Miembros.dart';
import '../Pages/Noticias.dart';
import '../Pages/Servicios.dart';
import '../Pages/Video.dart';

class widget_DrawerNotLogin extends StatelessWidget {
  const widget_DrawerNotLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text(
          "Inicio",
        ),
        iconColor: Colors.white,
        textColor: Colors.white,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed("/");
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Historia"),
        iconColor: Colors.white,
        textColor: Colors.white,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Historia.routeName);
        },
      ),
      ListTile(
        leading: const Icon(
          FontAwesomeIcons.peopleCarryBox,
        ),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Servicios"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Servicio.routeName);
        },
      ),
      ListTile(
        leading: const Icon(Icons.notifications_none),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Noticias"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Noticias.routeName);
        },
      ),
      ListTile(
        leading: Icon(Icons.video_collection),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Video"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Video.routeName);
        },
      ),
      ListTile(
        leading: Icon(Icons.holiday_village),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Albergues"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Albergues.routeName);
        },
      ),
      ListTile(
        leading: const Icon(Icons.location_on),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Ubicacion de Albergues"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(MapDetails.routeName);
        },
      ),
      ListTile(
        leading: Icon(Icons.warning_amber),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: Text("Medidas Preventivas"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .pushReplacementNamed(MedidasPreventivas.routeName);
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.peopleRoof),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: Text("Miembros"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Miembros.routeName);
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.handshake),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: Text("Quiero ser voluntario"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .pushReplacementNamed(FormQuieroVoluntario.routeName);
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.addressCard),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: Text("Acerca de"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(AboutMe.routeName);
        },
      ),
    ]);
  }
}
