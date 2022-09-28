
import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/models/employee_model.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<EmployeeModel>> getEmployeesByRestaurant(int restaurant);
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {

  final HttpProvider _httpProvider;
  final SessionLocalDataSource _sessionLocalDataSource;

  EmployeeRemoteDataSourceImpl({
    required HttpProvider httpProvider,
    required SessionLocalDataSource sessionLocalDataSource
  }) :
    _httpProvider = httpProvider,
    _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<List<EmployeeModel>> getEmployeesByRestaurant(int restaurant) async {
    final response = await _httpProvider.get('$BASE_URL/restaurant/waiter/$restaurant');
    return List<EmployeeModel>.from(response.map((x) => EmployeeModel.fromJson(x)));
  }

}