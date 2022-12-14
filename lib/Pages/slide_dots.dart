import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class slide_dots extends StatelessWidget {
  bool isActive;
  slide_dots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: isActive ? Theme.of(context).primaryColor : Colors.amber),
    );
  }
}
