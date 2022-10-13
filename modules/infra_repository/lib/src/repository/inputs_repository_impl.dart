import 'package:drift/drift.dart';
import 'package:model/input.dart';
import 'package:application/inputs.dart';

import '../drift_wrapper/drift_database.dart' as drift;

class InputsRepositoryImpl implements InputsRepository{
  final drift.EuLtdaDriftDatabase database;
  final drift.$InputsTable table;

  InputsRepositoryImpl(this.database) : table = database.inputs;

  static InputsRepositoryImpl createNull({List<Input> values = const []}) {
    var repo = InputsRepositoryImpl(drift.EuLtdaDriftDatabase.createNull());
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
