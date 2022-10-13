// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Input extends DataClass implements Insertable<Input> {
  final int id;
  final String name;
  final double buyQnt;
  final String mesureUnit;
  const Input(
      {required this.id,
      required this.name,
      required this.buyQnt,
      required this.mesureUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['buy_qnt'] = Variable<double>(buyQnt);
    map['mesure_unit'] = Variable<String>(mesureUnit);
    return map;
  }

  InputsCompanion toCompanion(bool nullToAbsent) {
    return InputsCompanion(
      id: Value(id),
      name: Value(name),
      buyQnt: Value(buyQnt),
      mesureUnit: Value(mesureUnit),
    );
  }

  factory Input.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Input(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      buyQnt: serializer.fromJson<double>(json['buyQnt']),
      mesureUnit: serializer.fromJson<String>(json['mesureUnit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'buyQnt': serializer.toJson<double>(buyQnt),
      'mesureUnit': serializer.toJson<String>(mesureUnit),
    };
  }

  Input copyWith({int? id, String? name, double? buyQnt, String? mesureUnit}) =>
      Input(
        id: id ?? this.id,
        name: name ?? this.name,
        buyQnt: buyQnt ?? this.buyQnt,
        mesureUnit: mesureUnit ?? this.mesureUnit,
      );
  @override
  String toString() {
    return (StringBuffer('Input(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('buyQnt: $buyQnt, ')
          ..write('mesureUnit: $mesureUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, buyQnt, mesureUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Input &&
          other.id == this.id &&
          other.name == this.name &&
          other.buyQnt == this.buyQnt &&
          other.mesureUnit == this.mesureUnit);
}

class InputsCompanion extends UpdateCompanion<Input> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> buyQnt;
  final Value<String> mesureUnit;
  const InputsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.buyQnt = const Value.absent(),
    this.mesureUnit = const Value.absent(),
  });
  InputsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double buyQnt,
    required String mesureUnit,
  })  : name = Value(name),
        buyQnt = Value(buyQnt),
        mesureUnit = Value(mesureUnit);
  static Insertable<Input> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? buyQnt,
    Expression<String>? mesureUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (buyQnt != null) 'buy_qnt': buyQnt,
      if (mesureUnit != null) 'mesure_unit': mesureUnit,
    });
  }

  InputsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? buyQnt,
      Value<String>? mesureUnit}) {
    return InputsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      buyQnt: buyQnt ?? this.buyQnt,
      mesureUnit: mesureUnit ?? this.mesureUnit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (buyQnt.present) {
      map['buy_qnt'] = Variable<double>(buyQnt.value);
    }
    if (mesureUnit.present) {
      map['mesure_unit'] = Variable<String>(mesureUnit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InputsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('buyQnt: $buyQnt, ')
          ..write('mesureUnit: $mesureUnit')
          ..write(')'))
        .toString();
  }
}

class $InputsTable extends Inputs with TableInfo<$InputsTable, Input> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InputsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _buyQntMeta = const VerificationMeta('buyQnt');
  @override
  late final GeneratedColumn<double> buyQnt = GeneratedColumn<double>(
      'buy_qnt', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _mesureUnitMeta = const VerificationMeta('mesureUnit');
  @override
  late final GeneratedColumn<String> mesureUnit = GeneratedColumn<String>(
      'mesure_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, buyQnt, mesureUnit];
  @override
  String get aliasedName => _alias ?? 'inputs';
  @override
  String get actualTableName => 'inputs';
  @override
  VerificationContext validateIntegrity(Insertable<Input> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('buy_qnt')) {
      context.handle(_buyQntMeta,
          buyQnt.isAcceptableOrUnknown(data['buy_qnt']!, _buyQntMeta));
    } else if (isInserting) {
      context.missing(_buyQntMeta);
    }
    if (data.containsKey('mesure_unit')) {
      context.handle(
          _mesureUnitMeta,
          mesureUnit.isAcceptableOrUnknown(
              data['mesure_unit']!, _mesureUnitMeta));
    } else if (isInserting) {
      context.missing(_mesureUnitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Input map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Input(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      buyQnt: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}buy_qnt'])!,
      mesureUnit: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}mesure_unit'])!,
    );
  }

  @override
  $InputsTable createAlias(String alias) {
    return $InputsTable(attachedDatabase, alias);
  }
}

abstract class _$EuLtdaDriftDatabase extends GeneratedDatabase {
  _$EuLtdaDriftDatabase(QueryExecutor e) : super(e);
  late final $InputsTable inputs = $InputsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [inputs];
}
