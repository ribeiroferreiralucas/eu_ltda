library api;

import 'package:model/input.dart';

class InputApi {
  List<Input> updateInputs(Map<String, InputChangeRequest> inputsNewValues) {
    var input = Input("", 0.0, "");
    input.updateValues(
        name: inputsNewValues[""]?.name,
        buyQnt: inputsNewValues[""]?.buyQnt,
        mesureUnit: inputsNewValues[""]?.mesureUnit);

    return [Input("", 0.0, "")];
  }
}

class InputChangeRequest {
  final String id;

  final String? name;

  final double? buyQnt;

  final String? mesureUnit;

  InputChangeRequest(
      {required this.id, this.name, this.buyQnt, this.mesureUnit});
}
