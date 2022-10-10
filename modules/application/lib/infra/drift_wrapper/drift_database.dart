import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'drift_database.g.dart';

class Inputs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get buyQnt => real()();
  TextColumn get mesureUnit => text()();
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Inputs])
class EuLtdaDriftDatabase extends _$EuLtdaDriftDatabase {
    // we tell the database where to store the data with this constructor
  EuLtdaDriftDatabase(QueryExecutor? queryExecutor) : super(queryExecutor == null ? _openConnection() : queryExecutor);

  static EuLtdaDriftDatabase createNull(){
    return EuLtdaDriftDatabase(NativeDatabase.memory());
  }
  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}