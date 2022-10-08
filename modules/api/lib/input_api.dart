import 'package:application/infra/repository/inputs_repository.dart';
import 'package:model/input.dart';

class InputApi {

  final InputsRepository inputsRepository;
  
  InputApi(this.inputsRepository);

  List<Input> listAllInputs() {
    List<Input> allInputs = inputsRepository.listAll();
    return allInputs;
  }
}
