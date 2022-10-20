import 'package:drift/drift.dart';
import 'query_executor_factory_null_creator.dart';

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
  EuLtdaDriftDatabase(QueryExecutor queryExecutor) : super(queryExecutor);

  EuLtdaDriftDatabase.createNull() : super(createNullQueryExecutor());
  
  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
