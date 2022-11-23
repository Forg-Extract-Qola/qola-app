import 'package:get_it/get_it.dart';
import 'package:qola_app/core/data/box_repository.dart';
import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/providers/preferences_provider.dart';
import 'package:qola_app/layouts/menu/cubits/menu_bar_cubit.dart';
import 'package:qola_app/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:qola_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:qola_app/modules/auth/domain/use_cases/do_admin_login.dart';
import 'package:qola_app/modules/auth/presentation/bloc/admin/admin_login_bloc.dart';
import 'package:qola_app/modules/order/data/data_sources/dish_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_local_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/order_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/table_local_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/table_remote_data_source.dart';
import 'package:qola_app/modules/order/data/resporitories/dish_repository_impl.dart';
import 'package:qola_app/modules/order/data/resporitories/employee_repository_impl.dart';
import 'package:qola_app/modules/order/data/resporitories/order_repository_impl.dart';
import 'package:qola_app/modules/order/data/resporitories/table_repository_impl.dart';
import 'package:qola_app/modules/order/domain/entities/employee_entity.dart';
import 'package:qola_app/modules/order/domain/entities/table_entity.dart';
import 'package:qola_app/modules/order/domain/repositories/dish_repository.dart';
import 'package:qola_app/modules/order/domain/repositories/employee_repository.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';
import 'package:qola_app/modules/order/domain/repositories/table_repository.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_create_table.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_employees.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_orders.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_tables.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_upload_table.dart';
import 'package:qola_app/modules/order/presentation/bloc/table/table_bloc.dart';
import 'package:qola_app/modules/order/presentation/cubits/employee/employee_cubit.dart';
import 'package:qola_app/modules/order/presentation/cubits/order/order_cubit.dart';
import 'package:qola_app/modules/order/presentation/cubits/table/table_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initLayouts();
  await initAuthModule();
  await initOrderModule();

  //! Core
  sl.registerLazySingleton(() => HttpProvider());
  sl.registerLazySingleton(() => AppPreferences());

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => await SharedPreferences.getInstance());

  //! BoxRepository
  await initBoxRepositories();

  //! Extra
  await (AppPreferences()).initPrefs();
}

Future<void> initLayouts() async {
  //! Cubits
  sl.registerFactory(() => MenuBarCubit());
}

Future<void> initAuthModule() async {
  //! Blocs
  sl.registerFactory(() => AdminLoginBloc(doAdminLogin: sl()));

  //! Use Cases
  sl.registerLazySingleton(() => DoAdminLogin(authRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: sl(), sessionLocalDataSource: sl()));

  //! Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(httpProvider: sl()));
  sl.registerLazySingleton<SessionLocalDataSource>(
      () => SessionLocalDataSourceImpl(appPreferences: sl()));
}

Future<void> initOrderModule() async {
  //! Blocs
  sl.registerFactory(() => TableBloc(
    doCreateTable: sl(),
    doUpdateTable: sl()
  ));
  //! Cubits
  sl.registerFactory(() => EmployeeCubit(doLoadEmployees: sl()));
  sl.registerFactory(() => TableCubit(doLoadTables: sl()));
  sl.registerFactory(() => OrderCubit(doLoadOrders: sl()));

  //! Use Cases
  sl.registerLazySingleton(() => DoLoadEmployees(employeeRepository: sl()));
  sl.registerLazySingleton(() => DoLoadTables(tableRepository: sl()));
  sl.registerLazySingleton(() => DoCreateTables(tableRepository: sl()));
  sl.registerLazySingleton(() => DoUpdateTables(tableRepository: sl()));
  sl.registerLazySingleton(() => DoLoadOrders(orderRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(
        employeeRemoteDataSource: sl(),
        employeeLocalDataSource: sl()
      ));
  sl.registerLazySingleton<TableRepository>(() =>
      TableRepositoryImpl(
          tableRemoteDataSource: sl(),
          tableLocalDataSource: sl(),
          sessionLocalDataSource: sl()
      ));
  sl.registerLazySingleton<DishRepository>(() =>
      DishRepositoryImpl(
          dishRemoteDataSource: sl(),
          sessionLocalDataSource: sl()
      ));
  sl.registerLazySingleton<OrderRepository>(() =>
      OrderRepositoryImpl(
          orderRemoteDataSource: sl(),
          employeeRemoteDataSource: sl(),
          tableRemoteDataSource: sl(),
          sessionLocalDataSource: sl(),
          dishRemoteDataSource: sl()
      ));

  //! Data Sources
  sl.registerLazySingleton<EmployeeRemoteDataSource>(() =>
      EmployeeRemoteDataSourceImpl(
          httpProvider: sl(), sessionLocalDataSource: sl()));
  sl.registerLazySingleton<TableRemoteDataSource>(() =>
      TableRemoteDataSourceImpl(
          httpProvider: sl(), sessionLocalDataSource: sl()));
  sl.registerLazySingleton<EmployeeLocalDataSource>(() =>
      EmployeeLocalDataSourceImpl(
          employeeRepository: sl()));
  sl.registerLazySingleton<TableLocalDataSource>(() =>
      TableLocalDataSourceImpl(
          tableRepository: sl()));
  sl.registerLazySingleton<DishRemoteDataSource>(() =>
      DishRemoteDataSourceImpl(
          httpProvider: sl(),
          sessionLocalDataSource: sl()));
  sl.registerLazySingleton<OrderRemoteDataSource>(() =>
      OrderRemoteDataSourceImpl(
          httpProvider: sl(),
          sessionLocalDataSource: sl()));

}

Future<void> initBoxRepositories() async {
  //! Repositories
  sl.registerLazySingleton<BoxRepository<EmployeeEntity>>(() => BoxRepositoryImpl<EmployeeEntity>());
  sl.registerLazySingleton<BoxRepository<TableEntity>>(() => BoxRepositoryImpl<TableEntity>());
}
