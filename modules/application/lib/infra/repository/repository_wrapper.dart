import 'package:model/input.dart';

class RepositoryWrapper {
  final InnerStub stub;

  RepositoryWrapper(this.stub);

  static RepositoryWrapper createNull(
      {Map<String, List<Input>> baseValues = const {}}) {
    var stub = InnerStub(baseValues: baseValues);
    return RepositoryWrapper(stub);
  }

  List<Input> listAll(String collectionName) {
    return stub.database[collectionName];
  }
}

class InnerStub {
  dynamic _database;
  dynamic get database => _database;

  InnerStub({Map<String, List<Input>> baseValues = const {}}) {
    _database = Map();
    baseValues.entries.forEach((element) {
      _database[element.key] = element.value;
    });
  }
}
