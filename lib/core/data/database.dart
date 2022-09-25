import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  static final Database db = Database._private();
  Database._private();

  initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    //! Register adapters
  }
}