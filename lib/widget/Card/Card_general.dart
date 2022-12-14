import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Card_General(String foto, String title, String Descripcion,
    {bool isLocalImage = false, double height = 0, double width = 0}) {
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
            padding: const EdgeInsets.all(10),
            child: Text(
              '$title',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 19, bottom: 20),
            child: Text(
              '$Descripcion',
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ));
}
