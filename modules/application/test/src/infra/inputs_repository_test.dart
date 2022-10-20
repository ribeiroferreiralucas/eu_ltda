import 'package:application/src/inputs/inputs_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infra_repository/infra_repository.dart';

void main() {
  group('The Inputs Repository Factory', () {
    

    test("should create Inputs Repository", () {
      var euLtdaDriftDatabase = EuLtdaDriftDatabase.createNull();
      var inputsRepositoryFactory = InputsRepositoryFactory(euLtdaDriftDatabase);
      
      InputsRepository inputsRepository = inputsRepositoryFactory.create();
      
      expect(inputsRepository, isNotNull);
    });


    test("should create new Inputs Repository every time", () {
      var euLtdaDriftDatabase = EuLtdaDriftDatabase.createNull();
      var inputsRepositoryFactory = InputsRepositoryFactory(euLtdaDriftDatabase);
      
      InputsRepository inputsRepository = inputsRepositoryFactory.create();
      InputsRepository inputsRepository2 = inputsRepositoryFactory.create();
      
      expect(inputsRepository, IsDifferentThen(inputsRepository2));
    });
  }); 

}


class IsDifferentThen extends Matcher {
  final Object object;
  const IsDifferentThen(this.object);
  @override
  bool matches(Object? item, Map matchState) => item != object;
  @override
  Description describe(Description description) => description.add('different');
}