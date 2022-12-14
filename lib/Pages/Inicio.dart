import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'slide_dots.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  static const routeName = "/inicio";
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _currentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio")),
      drawer: MainDrawe(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: [
                Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 220,
                          width: double.infinity,
                          child: Image.network(
                            'https://teleantillas.com.do/wp-content/uploads/2022/02/WhatsApp-Image-2022-02-10-at-10.00.55-AM-780x470.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Director Defensa Civil expresa solidaridad a familiares de fallecidos",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 19),
                          child: const Text(
                            "La Defensa Civil y Edesur Dominicana acordaron estrechar lazos de colaboración interinstitucional, con el objetivo de prevenir, mitigar y dar respuesta ante un fenómeno atmosférico, que pueda afectar la estabilidad del sistema de distribución de energía en territorio concesionario de la empresa.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ))
                      ],
                    )),
                Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            'https://cdn.www.gob.pe/uploads/document/file/2150799/standard_ayuda%20humanitaria%202020%20%285%29.jpeg.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Acciones de Defensa Civil y Seguridad Ciudadana son también tareas que cumple el Goresam",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 19),
                          child: const Text(
                            "Sobre temas relacionados a defensa civil y seguridad ciudadana, el Gobierno Regional de San Martín (Goresam), mediante la Oficina Regional de Seguridad y Defensa Nacional (Orsdena), dio a conocer a la población sanmartinense un balance de acciones frente a los desastres naturales suscitados durante los primeros meses del presente año.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ))
                      ],
                    )),
                Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            'https://1.bp.blogspot.com/-E_PkJT3iSx0/YRa2xDkjRAI/AAAAAAAA23E/hObuIP1ilpUhG-pg0X0aDSoZVwJskJaoQCLcBGAsYHQ/s16000/Defensa%2BCivil%2Brealiza%2Blabores%2Bpreventivas%2By%2Bde%2Brespuesta%2Btras%2Bpaso%2Bdel%2Bfen%25C3%25B3meno%2Batmosf%25C3%25A9rico%2BFred.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Defensa Civil realiza labores preventivas y de respuesta tras paso del fenómeno atmosférico Fred",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 19),
                          child: const Text(
                            "Personal de la Defensa Civil Dominicana realizó desde tempranas horas del miércoles varias acciones preventivas y de respuesta con miras a proteger la vida y propiedades de la ciudadanía, ante los efectos de la tormenta tropical Fred sobre el país.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ))
                      ],
                    )),
              ],
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 3; i++)
                    GestureDetector(
                      onTap: () => setState(() {
                        buttonCarouselController.jumpToPage(i);
                      }),
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 150),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: i == _currentIndex ? 13 : 8,
                        width: i == _currentIndex ? 13 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: i == _currentIndex
                                ? Color(0xffFF7000)
                                : Color(0xff004C98)),
                      ),
                    )
                ]),
              ]),
            ),
          ]),
    );
  }
}
