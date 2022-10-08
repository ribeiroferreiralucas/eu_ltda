class Input {
  String _id;
  String get id => _id;

  String _name;
  String get name => _name;

  double _buyQnt;
  double get buyQnt => _buyQnt;

  String _mesureUnit;
  String get mesureUnit => _mesureUnit;

  Input(this._id, this._name, this._buyQnt, this._mesureUnit);

  static Input createNull(
      {String id = "Input_Id",
      String name = "Input Name",
      double buyQnt = 1000,
      String mesureUnit = 'units'}) {
    return Input(id, name, buyQnt, mesureUnit);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Input &&
          _id == other._id &&
          _name == other._name &&
          _buyQnt == other._buyQnt &&
          _mesureUnit == other._mesureUnit;
}
