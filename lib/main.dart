import 'package:flutter/material.dart';
import 'package:project_final/Pages/CambiarPass.dart';
import 'package:project_final/Pages/HomePage.dart';
import 'package:project_final/Pages/Mapa_Situaciones.dart';
import 'package:project_final/Pages/MisSituaciones.dart';
import 'package:project_final/Pages/RecuperarContrasena.dart';
import 'package:project_final/Pages/login.dart';
import 'package:project_final/Pages/AboutMe.dart';
import 'package:project_final/Pages/Albergues.dart';
import 'package:project_final/Pages/Form_QuieroVoluntario.dart';
import 'package:project_final/Pages/Historia.dart';
import 'package:project_final/Pages/Map.dart';
import 'package:project_final/Pages/MedidasPreventivas.dart';
import 'package:project_final/Pages/Miembros.dart';
import 'package:project_final/Pages/Noticias.dart';
import 'package:project_final/Pages/Servicios.dart';
import 'package:project_final/Pages/Video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Inicio.dart';
import 'Pages/ReportarSituacio.dart';
import 'Pages/main_Drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: const Color(0xffFF7000)),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //initialRoute: "/login",
      routes: {
        "/": (_) => Inicio(),
        Historia.routeName: (_) => const Historia(),
        Servicio.routeName: (_) => const Servicio(),
        Miembros.routeName: (_) => const Miembros(),
        Noticias.routeName: (_) => const Noticias(),
        Video.routeName: (_) => const Video(),
        Albergues.routeName: (_) => const Albergues(),
        MapDetails.routeName: (_) => MapDetails(),
        MedidasPreventivas.routeName: (_) => const MedidasPreventivas(),
        MapaSituacionesState.routeName: (_) => const MapaSituaciones(),
        MisSituaciones.routeName: (_) => const MisSituaciones(),
        AboutMe.routeName: (_) => const AboutMe(),
        RecuperarContrasenaState.routeName: (_) => RecuperarContrasena(),
        ReportarSituacio.routeName: (_) => const ReportarSituacio(),
        CambiarPassState.routeName: (_) => const CambiarPass(),
        Login.routeName: (_) => const Login(),
        Albergues.routeName: (_) => const Albergues(),
        Albergues.routeName: (_) => const Albergues(),
        FormQuieroVoluntario.routeName: (_) => const FormQuieroVoluntario()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  bool islogin = false;
  @override
  void initState() {
    // TODO: implement initState
    InitShrp();
    super.initState();
  }

  void InitShrp() async {
    final SharedPreferences prefs = await _sharedPreferences;

    if (prefs.getString("user") != null) {
      setState(() {
        islogin = true;
      });
    } else {
      setState(() {
        islogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
