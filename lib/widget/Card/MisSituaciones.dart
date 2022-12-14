import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MisSituaciones_Widget(String foto, String title,
    {bool isLocalImage = false,
    bool showEstado = false,
    double height = 0,
    double width = 0,
    String Descripcion = "",
    String fecha = "",
    String Estado = ""}) {
  return Card(
      margin: EdgeInsets.all(20),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      child: Column(
        children: [
          SizedBox(
            height: height > 0 ? height : 240,
            width: width > 0 ? width : double.infinity,
            child: isLocalImage
                ? Image.asset(
                    foto,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    '$foto',
                    fit: BoxFit.fill,
                  ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              '$title',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          showEstado
              ? Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 2),
                  child: Text(
                    '($Estado)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              : Text(""),
          Descripcion != ""
              ? Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 19, bottom: 20),
                  child: Text(
                    '$Descripcion',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              : Text(""),
          fecha != ""
              ? Container(
                  margin: EdgeInsets.only(left: 180, top: 20),
                  padding:
                      const EdgeInsets.only(left: 10, right: 19, bottom: 20),
                  child: Text(
                    fecha,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                )
              : Text("")
        ],
      ));
}
