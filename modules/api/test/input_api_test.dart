import 'package:api/input_api.dart';
import 'package:application/infra/repository/inputs_repository.dart';
import 'package:model/input.dart';
import 'package:test/test.dart';

void main() {
  group('The InputApi', () {

    test('should list all Inputs in InputsRepository', () {
      InputsRepository inputsRepository = InputsRepository.createNull(values: [Input.createNull()]);
      var inputApi = new InputApi(inputsRepository);

      List<Input> inputListResponse = inputApi.listAllInputs();

      var expectedInputs = [Input.createNull()];
      expect(inputListResponse, equals(expectedInputs));
    });
  
  });
}
