import 'package:drift/drift.dart';

@DataClassName('FavoriteData')
class Favorites extends Table {
  TextColumn get id => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  TextColumn get name => text()();
  RealColumn get price => real()();
  TextColumn get image => text()();
}
