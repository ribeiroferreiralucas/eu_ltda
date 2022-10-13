import 'package:api/input_api.dart';
import 'package:application/inputs.dart';
import 'package:model/input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('The InputApi', () {
    test('should list all Inputs in InputsRepository', () async {
      InputsRepository inputsRepository = InputsRepositoryFactory().createNull(values: [Input.createTestInstance()]);
      var inputApi = new InputApi(inputsRepository);

      List<Input> inputListResponse = await inputApi.listAllInputs();

      var expectedInputs = [Input.createTestInstance()];
      expect(inputListResponse, equals(expectedInputs));
    });
  });
}
