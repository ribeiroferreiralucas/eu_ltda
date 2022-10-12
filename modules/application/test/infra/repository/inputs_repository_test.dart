import 'dart:ffi';

import 'package:application/infra/drift_wrapper/drift_database.dart';
import 'package:application/infra/repository/inputs_repository.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:model/input.dart' as domain;


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
      test("SHOULD retrieve registered Input as Input class with all registered values", () async {
        var inputTableRegistry = newInputTableRegistry(id: 1);
        await insertData(database, [inputTableRegistry]);

        List<domain.Input> list = await callListAll(inputsRepository);

        var expectedInput = domain.Input(1, inputTableRegistry.name.value, inputTableRegistry.buyQnt.value, inputTableRegistry.mesureUnit.value);
        expect(list[0], expectedInput);
      });

      test("SHOULD list all data", () async {
        await insertData(database, [newInputTableRegistry(), newInputTableRegistry(), newInputTableRegistry(), newInputTableRegistry()]);

        List<domain.Input> list = await callListAll(inputsRepository);
        expect(list.length, equals(4));
      });

      test("SHOULD return empty list IF there is no data on database", () async {
        List<domain.Input> list = await callListAll(inputsRepository);
        expect(list.length, equals(0));
      });
    });
  });
}


InputsCompanion newInputTableRegistry({int? id, String name = 'anyName', double buyQnt = 1000, String mesureUnit = 'units'}) => 
    InputsCompanion.insert(id: Value.ofNullable(id), name: name, buyQnt: buyQnt, mesureUnit: mesureUnit);

Future<List<domain.Input>> callListAll(InputsRepository inputsRepository) async {
  var list = await inputsRepository.listAll();
  return list;
}
Future<void> insertData(EuLtdaDriftDatabase database, List<InputsCompanion> datas) {
  return database.batch((batch) => batch.insertAll(database.inputs, datas));
}
