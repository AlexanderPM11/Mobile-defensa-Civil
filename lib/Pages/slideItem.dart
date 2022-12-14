import 'package:flutter/cupertino.dart';

class slideItem extends StatelessWidget {
  const slideItem({super.key});
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "http://alexanderpolanco.com/src/profile.jpeg"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Description of my image")
      ],
    );
  }
}
