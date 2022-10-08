
import 'package:application/infra/repository/repository_wrapper.dart';
import 'package:model/input.dart';

class InputsRepository {

  final RepositoryWrapper repositoryWrapper;

  InputsRepository(this.repositoryWrapper);

  static InputsRepository createNull({List<Input> values = const []}) {
    var repositoryWrapper = RepositoryWrapper.createNull(baseValues: {'inputs': values});
    return InputsRepository(repositoryWrapper);
  }

  List<Input> listAll() {
    return repositoryWrapper.listAll("inputs");
  }
}