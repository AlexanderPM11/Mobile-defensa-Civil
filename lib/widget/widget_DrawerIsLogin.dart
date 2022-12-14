import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/Albergues.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/MapaSituacion.dart';
import '../Pages/CambiarPass.dart';
import '../Pages/Mapa_Situaciones.dart';
import '../Pages/MisSituaciones.dart';
import '../Pages/Noticias.dart';
import '../Pages/ReportarSituacio.dart';
import '../Pages/Mapa_Situaciones.dart';

class widget_DrawerIsLogin extends StatelessWidget {
  widget_DrawerIsLogin({super.key});

  void logout() async {
    Future<SharedPreferences> _sharedPreferences =
        SharedPreferences.getInstance();
    final SharedPreferences prefs = await _sharedPreferences;
    if (prefs.getString("user") != null) {
      await prefs.remove('user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.notifications_none),
        title: const Text(
          "Noticias",
        ),
        iconColor: Colors.white,
        textColor: Colors.white,
        onTap: () {
          Navigator.of(context).pushReplacementNamed(Noticias.routeName);
        },
      ),
      ListTile(
        leading: const Icon(Icons.report_problem_outlined),
        title: const Text("Reportar Situacion"),
        iconColor: Colors.white,
        textColor: Colors.white,
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(ReportarSituacio.routeName);
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.collections_bookmark_outlined,
        ),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Mis Situaciones"),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(MisSituaciones.routeName);
        },
      ),
      ListTile(
        leading: Icon(Icons.location_on),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Mapa de situaciones"),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(MapaSituacionesState.routeName);
        },
      ),
      ListTile(
        leading: Icon(Icons.change_circle_outlined),
        iconColor: Colors.white,
        textColor: Colors.white,
        title: const Text("Cambiar contraseña"),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(CambiarPassState.routeName);
        },
      ),
    ]);
  }
}
