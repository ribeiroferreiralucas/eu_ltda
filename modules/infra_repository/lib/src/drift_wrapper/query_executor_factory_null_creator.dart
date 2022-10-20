
import 'package:drift/drift.dart';
import 'native_database_stub.dart'
  if (dart.library.ffi) 'package:drift/native.dart';

QueryExecutor createNullQueryExecutor() {
  return NativeDatabase.memory();
}