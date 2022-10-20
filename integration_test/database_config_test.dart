import 'package:drift/drift.dart' as drift;
import 'package:eu_ltda/src/config/database/database_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('When web app start up', () {
    testWidgets('should provide Query Executor',
        (tester) async {

        drift.QueryExecutor queryExecutor = databaseLocator.getQueryExecutor();

        expect(queryExecutor, isNotNull);
    });

    testWidgets('should provide always same Query Executor',
        (tester) async {

        drift.QueryExecutor queryExecutor = databaseLocator.getQueryExecutor();
        drift.QueryExecutor queryExecutor2 = databaseLocator.getQueryExecutor();

        expect(queryExecutor, same(queryExecutor2));
    });


    testWidgets('should provide a openable Query Executor',
        (tester) async {

        drift.QueryExecutor queryExecutor = databaseLocator.getQueryExecutor();
        
        bool opened = await queryExecutor.ensureOpen(AnyDatabaseUser());
        expect(opened, isTrue);
    });
  });

}


class AnyDatabaseUser implements drift.QueryExecutorUser {
  @override
  Future<void> beforeOpen(drift.QueryExecutor queryExecutor, drift.OpeningDetails details) {
    return Future.value();
  }
  
  @override
  int get schemaVersion => 1;

}