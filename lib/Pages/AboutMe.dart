import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});
  static const routeName = "/aboutMe";
  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  double height_Ima = 200;
  double profile_Height = 50;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawe(),
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [buidTop()],
      ),
    );
  }

  Widget buidTop() {
    double top = 154;
    return Stack(
      children: [
        Container(
          child: CoverImgage(),
        ),
        Positioned(
          child: ProfileImgage(),
          left: 0,
          right: 0,
          top: 140,
        ),
        BuildContent()
      ],
    );
  }

  Widget CoverImgage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/backgroudprofile.png",
          width: double.infinity,
          height: height_Ima,
          fit: BoxFit.cover,
        ),
      );

  // ignore: non_constant_identifier_names
  Widget BuildContent() => Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          const Text(
            "Alexander Polanco",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text("Ingeniero de software",
              style:
                  TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcons(
                  FontAwesomeIcons.telegram, "https://t.me/alexanderJpm"),
              const SizedBox(
                width: 20,
              ),
              SocialMediaIcons(
                  FontAwesomeIcons.phone, "https://wa.me/8099160699"),
              const SizedBox(
                width: 20,
              ),
              SocialMediaIcons(FontAwesomeIcons.linkedin,
                  "https://www.linkedin.com/in/alexander-polanco-moreno-465092238/"),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberWidget(38, "Proyectos"),
              const SizedBox(
                width: 28,
              ),
              numberWidget(529, "Siguiendo"),
              const SizedBox(
                width: 28,
              ),
              numberWidget(3300, "Seguidores"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Color(0xffFF7000),
            indent: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          AboutMe(),
        ],
      );

  // ignore: non_constant_identifier_names
  Widget ProfileImgage() => CircleAvatar(
        radius: profile_Height,
        child: Image.asset("assets/profile.png"),
      );
  // ignore: non_constant_identifier_names
  Widget SocialMediaIcons(IconData icons, String url) => GestureDetector(
        onTap: () => launchUrl(Uri.parse("${url}"),
            mode: LaunchMode.externalApplication),
        child: CircleAvatar(
          radius: 25,
          child: Center(
            child: Icon(icons),
          ),
        ),
      );
  Widget AboutMe() => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                "Sobre mi",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "Joven apasionado por la informática en general. Pero, especialmente en desarrollo de software. En la actualidad me encuentro estudiante Desarrollo De Software en el instituto Tecnológico de las Américas (ITLA).\n\nMe considero una personas humilde y con valores fundamentales para tener de una sociedad mejor. Día a día pongo todo mi empeño en cumplir los sueños y metas que me he trazado.\n\nEntre mis hobbies y pasiones estan las siguientes: Nadar, Montar bicicleta, Programar, Correr, Jugar ajedrez, etc....",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );

  Widget numberWidget(int value, String reference) {
    return Container(
      child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${value}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              width: 2,
            ),
            Text("${reference}"),
          ]),
    );
  }
}
