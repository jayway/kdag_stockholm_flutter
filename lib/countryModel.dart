class CountryModel {
  String _countryImgPath;
  String _countryName;

  CountryModel(this._countryImgPath, this._countryName);

  String get countryName => _countryName;

  String get countryImgPath => _countryImgPath;
}