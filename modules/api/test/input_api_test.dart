import 'package:api/input_api.dart';
import 'package:application/infra/repository/inputs_repository.dart';
import 'package:model/input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('The InputApi', () {

    test('should list all Inputs in InputsRepository', () async {
      InputsRepository inputsRepository = InputsRepository.createNull(values: [Input.createNull()]);
      var inputApi = new InputApi(inputsRepository);

      List<Input> inputListResponse = await inputApi.listAllInputs();

      var expectedInputs = [Input.createNull()];
      expect(inputListResponse, equals(expectedInputs));
    });
  
  });
}
