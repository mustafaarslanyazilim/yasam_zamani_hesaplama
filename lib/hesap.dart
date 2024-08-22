import 'package:yasam_zamani_hesaplama/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double? hesaplama() {
    double sonuc;

    sonuc = (90 +
        _userData.haftalikSpor!.toDouble() -
        _userData.icilenSigara!.toDouble());
    sonuc = sonuc + (_userData.boy! / _userData.kg!);
    if (_userData.seciliCinsiyet == "KADIN") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
