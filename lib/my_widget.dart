import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  //final demek bir kez oluşturduktan sonra bir daha değiştirilemez.
  final Color renk;
  final Widget child;
  final void Function()? onPress;

  MyWidget({this.renk = Colors.white, required this.child, this.onPress}) {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //gestureDetector  -- buton gibi davranabilme özelliği verir.
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12), //dışarı doğru çevresinden uzaklaşması için
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
      ),
    );
  }
}
