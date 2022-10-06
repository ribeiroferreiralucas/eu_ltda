
class Input {
  String _name;
  String get name => _name;

  double _buyQnt;
  double get buyQnt => _buyQnt;
  
  String _mesureUnit;
  String get mesureUnit => _mesureUnit;

  Input(this._name, this._buyQnt, this._mesureUnit);

  
  updateValues({String? name, double? buyQnt, String? mesureUnit}){
    _name = (name == null ? name : _name)!;
    
  }

}
