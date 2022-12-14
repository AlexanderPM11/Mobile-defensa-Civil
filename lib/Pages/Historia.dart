import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/main_Drawer.dart';

class Historia extends StatefulWidget {
  const Historia({super.key});
  static String routeName = "/historia";

  @override
  State<Historia> createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  final ScrollController horizontalScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Historia")),
        drawer: MainDrawe(),
        body: Scrollbar(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
                    child: Text(
                  "Historia de la defensa civil",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              Image.asset(
                "assets/historia_img.png",
                width: 200,
                height: 200,
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: Center(
                      child: RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      text:
                          "Antes del año 1966, cuando llegaba la temporada de huracanes, un grupo de radioaficionados se reunía en la Cruz Roja para estar atentos por si surgía algún tipo de emergencia, inmediatamente ponerse a disposición y ayudar en todo lo posible, inclusive, usando sus propios equipos de comunicación para así tener contacto con el exterior en caso de que las redes telefónicas resultaran afectadas.\n\nAl surgir el triunvirato fue designado el Dr. Rafael Cantizano Arias, como presidente de la Cruz Roja y al mismo tiempo nombraron al Ing. Carlos D´ Franco como director de la Defensa Civil, quien con un grupo compuesto por seis personas, se instaló en la calle Francia esquina Galván, siendo esa la primera oficina de la Defensa Civil.\n\nAl surgir el Gobierno Provisional, presidido por el Dr. Héctor García Godoy, a los diecisiete días del mes de junio de 1966, fue promulgada la Ley 257, mediante la cual fue creada la Defensa Civil, institución dependiente de la Secretaría Administrativa de la Presidencia (ahora Ministerio de la Presidencia) y quien en la actualidad preside la Comisión Nacional de Emergencias.\n\nMás adelante, el local fue trasladado a la calle Dr. Delgado No. 164 y luego en la gestión del Contralmirante Radhamés Lora Salcedo se reubicó a la Plaza de la Salud, donde aún permanece.\n\nLa Defensa Civil tiene por objetivo principal asegurar que los operativos del país sean adecuados para los perjuicios que se originen por los desastres causados por inundación, terremoto, tormenta, huracán, fuego, escasez o distribución deficiente de suministro de materiales, u otros motivos similares, y en general para proveer el orden, salud y bienestar económico, seguridad pública prevención de la vida y de la propiedad en tales circunstancias.",
                      style: TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\n\nMisión",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "\n\nDirigir las acciones de coordinación, preparación y operación de todas las funciones de emergencias ante la ocurrencia de un evento natural o antrópico en una forma eficiente y eficaz, garantizando un control adecuado de las operaciones para resguardar la vida y la propiedad de los habitantes de República Dominicana."),
                        TextSpan(
                            text: "\n\nVisión",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "\n\nPerdurar a través del tiempo como una Institución de servicio y socorro con una correcta distribución de ayudas humanitarias y priorizar las necesidades ante cualquier evento nacional, garantizando la responsabilidad, esfuerzo y compromiso de las instituciones involucradas para una respuesta eficaz y eficiente.")
                      ],
                    ),
                  )))
            ],
          ),
        ));
  }
}
