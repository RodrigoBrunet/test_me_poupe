import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_me_poupe/models/modeldb.dart';

import '../common/const.dart';

Future<Database> _getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), DATA_BASE_NAME),
    onCreate: (db, version) {
      return db.execute(CREATE_ADDRESS_TABLE_SCRIPT);
    },
    version: 1,
  );
}

Future create(Modeldb model) async {
  try {
    final Database db = await _getDatabase();

    await db.insert(
      TABLE_NAME,
      model.toMap(),
    );
  } catch (ex) {
    print(ex);
    return;
  }
}
