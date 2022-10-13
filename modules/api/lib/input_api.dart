import 'package:application/inputs.dart';
import 'package:model/input.dart';

class InputApi {

  final InputsRepository inputsRepository;
  
  InputApi(this.inputsRepository);

  Future<List<Input>> listAllInputs() {
    return inputsRepository.listAll();
  }
}
