class CountryModel {
  String _countryImgPath;
  String _countryName;
  String _fullName;

  CountryModel(this._countryImgPath, this._countryName, this._fullName);

  String get countryName => _countryName;

  String get countryImgPath => _countryImgPath;

  String get fullName => _fullName;
}
