import 'package:application/infra/drift_wrapper/drift_database.dart';
import 'package:application/infra/repository/inputs_repository.dart';
import 'package:flutter_test/flutter_test.dart';


var newInput = InputsCompanion.insert;
void main() {
  group('The Inputs Repository', () {
    late EuLtdaDriftDatabase database;
    late InputsRepository inputsRepository;

    setUp(() {
      database = EuLtdaDriftDatabase.createNull();
      inputsRepository = InputsRepository(database);
    });

    tearDown(() {
      database.close();
    });

    group('WHEN Listing All data', () {
      test("SHOULD list all data", () async {
        await insertData(database, [newInput(name: 'anyName', buyQnt: 0.5, mesureUnit: 'units')]);

        var list = await inputsRepository.listAll();
        expect(list.length, equals(1));
      });

      test("SHOULD return empty list IF there is no data on database", () async {
        var list = await inputsRepository.listAll();
        expect(list.length, equals(0));
      });
    });
  });
}

Future<void> insertData(EuLtdaDriftDatabase database, List<InputsCompanion> datas) {
  return database.batch((batch) => batch.insertAll(database.inputs, datas));
}

