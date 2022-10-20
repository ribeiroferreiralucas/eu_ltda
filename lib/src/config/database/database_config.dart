

import 'package:drift/drift.dart';
import 'package:drift/web.dart';

const databaseLocator = DatabaseInitializer();

const String _databaseName = "app_data";
final QueryExecutor _queryExecutor = WebDatabase(_databaseName);

class DatabaseInitializer {
  
  const DatabaseInitializer();

  QueryExecutor getQueryExecutor() {
    return _queryExecutor;
  }
}