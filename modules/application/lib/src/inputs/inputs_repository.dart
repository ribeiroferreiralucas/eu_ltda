
import 'package:infra_repository/infra_repository.dart' as infra;
import 'package:model/input.dart';


abstract class InputsRepository {
  Future<List<Input>> listAll();
}


class InputsRepositoryFactory {
  final infra.EuLtdaDriftDatabase database;

  InputsRepositoryFactory(this.database);

  InputsRepository create() {
    return infra.InputsRepositoryImpl(database);
  }

  static InputsRepository createNull({List<Input> values = const []}){
    return infra.InputsRepositoryImpl.createNull(values: values);
  }

}