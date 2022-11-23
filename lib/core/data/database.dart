import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qola_app/modules/order/domain/entities/employee_entity.dart';
import 'package:qola_app/modules/order/domain/entities/table_entity.dart';

class Database {
  static final Database db = Database._private();
  Database._private();

  initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    //! Register adapters
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(EmployeeEntityAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(TableEntityAdapter());
  }
}