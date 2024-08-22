import 'package:flutter/material.dart';
import 'package:yasam_zamani_hesaplama/constants.dart';
import 'package:yasam_zamani_hesaplama/hesap.dart';
import 'package:yasam_zamani_hesaplama/user_data.dart';

class ResultPage extends StatelessWidget {
  //gelen veriyi kabul etmek için
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("SONUÇ SAYFASI")),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                "TAHMİN EDİLEN YAŞAM SÜRESİ",
                style: kMetinStili,
              ),
            ),
          ),
          Expanded(
            flex: 2, //flex ile sayfaya paylaşma oranı veriyoruz.
            child: Center(
              child: Text(
                Hesap(_userData).hesaplama()!.round().toString(),
                style: kMetinStili,
              ),
            ),
          ),
          Expanded(
            flex: 1, //flex ile sayfaya paylaşma oranı veriyoruz.
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context); //GERİ DÖNMEK İÇİN
              },
              child: Center(
                child: Text(
                  "GERİ DÖN",
                  style: kMetinStili,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
