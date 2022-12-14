import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Pages/Inicio.dart';
import 'package:project_final/Pages/slide_dots.dart';
import 'slideItem.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Acciones diarias")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Inicio()
          ],
        )

        // const SizedBox(
        //   height: 56,
        // ),
        // Column(
        //   children: [
        //     TextButton(onPressed: () => {}, child: const Text("Getting start")),
        //     Row(
        //       children: [
        //         const Text("Account"),
        //         TextButton(onPressed: () => {}, child: const Text("Login")),
        //       ],
        //     )
        //   ],
        // )
        );
  }
}
