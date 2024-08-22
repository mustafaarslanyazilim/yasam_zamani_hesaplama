class UserData {
  String? seciliCinsiyet;
  double? icilenSigara;
  double? haftalikSpor;
  int? boy;
  int? kg;

//kapsülleme
//bunu diğer sayfalarda kullanmak için yapıyoruz
  UserData(
      {this.boy,
      this.haftalikSpor,
      this.icilenSigara,
      this.kg,
      this.seciliCinsiyet});
}
