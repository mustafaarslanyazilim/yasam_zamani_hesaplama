import 'package:flutter/material.dart';
import 'package:yasam_zamani_hesaplama/constants.dart';

class MyMetod extends StatelessWidget {
  final IconData icon;
  final String cinsiyet;
  MyMetod({required this.icon, required this.cinsiyet}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      //bir kolon içinde ki elemanları ortalamak için
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        //ARALARINI AÇMAK İÇİN.
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        )
      ],
    );
  }
}
