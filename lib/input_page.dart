import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_zamani_hesaplama/constants.dart';
import 'package:yasam_zamani_hesaplama/my_metod.dart';
import 'package:yasam_zamani_hesaplama/my_widget.dart';
import 'package:yasam_zamani_hesaplama/result_page.dart';
import 'package:yasam_zamani_hesaplama/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double haftalikSpor = 0.0;
  int boy = 170;
  int kg = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        //kolonun yatayına uzaması için.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyWidget(child: buildRowOutlineButton("BOY")),
                ),
                Expanded(
                  child: MyWidget(child: buildRowOutlineButton("KİLO")),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyWidget(
              child: Column(
                //kolon içinde dikey uzaması için
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Gün Spor Yapıyorsunuz?",
                    style: kMetinStili,
                  ),
                  Text(
                    "${haftalikSpor.round()}",
                    //bunun yerine --> haftalikSpor.round().toString() kullanılabilir.
                    style: kTuruncuSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7, //parça sayısı
                    value: haftalikSpor,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          haftalikSpor = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyWidget(
              child: Column(
                //kolon içinde dikey uzaması için
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Tane Sigara İçiyorsunuz?",
                    style: kMetinStili,
                  ),
                  Text(
                    "${icilenSigara.round()}",
                    //bunun yerine --> icilenSigara.round().toString() kullanılabilir.
                    style: kYesilSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 40,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          icilenSigara = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightGreen
                        : Colors.white,
                    child: MyMetod(
                      icon: FontAwesomeIcons.mars,
                      cinsiyet: 'ERKEK',
                    ),
                  ),
                ),
                Expanded(
                  child: MyWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightGreen
                        : Colors.white,
                    child: MyMetod(
                        icon: FontAwesomeIcons.venus, cinsiyet: "KADIN"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TextButton(
              onPressed: () {
                //SAYFAYI DİĞER SAYFAYA GEÇİRMEK İÇİN BUTONA TIKLAMA YAPILINCA GEÇİŞ İÇİN.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        //nesne yaratılacak
                        UserData(
                            kg: kg,
                            boy: boy,
                            seciliCinsiyet: seciliCinsiyet,
                            haftalikSpor: haftalikSpor,
                            icilenSigara: icilenSigara)),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              child: Text(
                "HESAPLA",
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildRowOutlineButton(String label) {
    return Column(
      //ana ekseni dikey olduğu için
      //hem kolon da hem de row da aynı kullanım.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kMetinStili,
        ),
        Text(
          label == 'BOY' ? "$boy" : "$kg",
          style: kSariSayiStili,
        ),
        Row(
          //ana ekseni dikey olduğu için
          //hem kolon da hem de row da aynı kullanım.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              ///kullanmadım ama normalde buton temalarnı ayarlar.
              child: OutlinedButton(
                iconAlignment: IconAlignment.start,
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kg++;
                  });
                },
                child: Text(
                  //butonun birini text ile birini icon ile yaptım.
                  "+",
                  style: kMetinStili,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              child: OutlinedButton(
                iconAlignment: IconAlignment.end,
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kg--;
                  });
                },
                child: Icon(
                  //butonun birini text ile birini icon ile yaptım.
                  FontAwesomeIcons.minus,
                  size: 15,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
