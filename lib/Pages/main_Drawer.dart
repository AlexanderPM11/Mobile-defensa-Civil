import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/logOut.dart';
import '../widget/widget_DrawerNotLogin.dart';
import '../widget/widget_DrawerIsLogin.dart';
import 'login.dart';

class MainDrawe extends StatefulWidget {
  const MainDrawe({super.key});

  @override
  State<MainDrawe> createState() => _MainDraweState();
}

class _MainDraweState extends State<MainDrawe> {
  bool islogin = false;
  String nombre = "";
  String correo = "";
  @override
  void initState() {
    // TODO: implement initState
    InitShrp();
    super.initState();
  }

  void InitShrp() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("userLogin") != null) {
      final rawJson = prefs.getString('userLogin') ?? '';
      Map<String, dynamic> map = jsonDecode(rawJson);
      setState(() {
        nombre = map["nombre"];
        correo = map["correo"];

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
    return NotificationListener(
        child: Drawer(
      backgroundColor: const Color(0xff004C98),
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
            color: const Color(0xffFF7000),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                islogin
                    ? Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 232, 232),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://robohash.org/{$nombre}"),
                                fit: BoxFit.contain)),
                      )
                    : Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("./assets/historia_img.png"),
                                fit: BoxFit.fill)),
                      ),
                islogin
                    ? Column(
                        children: [
                          Text(
                            nombre,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            correo,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : const Text(""),
                islogin
                    ? ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        label: const Text("Log out"),
                        icon: const Icon(FontAwesomeIcons.powerOff),
                        onPressed: () async {
                          await logOut.logout();
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(Login.routeName);
                        },
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        label: const Text("Login"),
                        icon: const Icon(Icons.login),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(Login.routeName);
                        },
                      )
              ],
            ))),
        if (islogin) widget_DrawerIsLogin() else const widget_DrawerNotLogin()
      ]),
    ));
  }
}
