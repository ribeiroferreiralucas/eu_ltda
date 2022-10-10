import 'package:application/infra/drift_wrapper/drift_database.dart' as drift;
import 'package:drift/drift.dart';
import 'package:model/input.dart';

class InputsRepository {
  final drift.EuLtdaDriftDatabase database;
  final drift.$InputsTable table;

  InputsRepository(this.database) : table = database.inputs;

  static InputsRepository createNull({List<Input> values = const []}) {
    var repo = InputsRepository(drift.EuLtdaDriftDatabase.createNull());
    var database = repo.database;

    var inputsTable = database.inputs;
    values.forEach((element) {
      var inputsRegistry = drift.InputsCompanion.insert(
          id: Value(element.id),
          name: element.name,
          buyQnt: element.buyQnt,
          mesureUnit: element.mesureUnit);
      database.into(inputsTable).insert(inputsRegistry);
    });
    return repo;
  }

  Future<List<Input>> listAll() {
    return database
        .select(this.table)
        .get()
        .then((value) => value.map(toDomain).toList());
  }

  Input toDomain(e) => Input(e.id, e.name, e.buyQnt, e.mesureUnit);
}
