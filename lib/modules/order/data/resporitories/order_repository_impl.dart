import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/dish_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/order_remote_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/table_remote_data_source.dart';
import 'package:qola_app/modules/order/data/factories/dish_factory.dart';
import 'package:qola_app/modules/order/data/factories/employee_factory.dart';
import 'package:qola_app/modules/order/data/factories/order_factory.dart';
import 'package:qola_app/modules/order/data/factories/table_factory.dart';
import 'package:qola_app/modules/order/data/models/employee_model.dart';
import 'package:qola_app/modules/order/data/models/order_dish_model.dart';
import 'package:qola_app/modules/order/data/models/order_model.dart';
import 'package:qola_app/modules/order/data/models/table_model.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dish.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {

  final OrderRemoteDataSource _orderRemoteDataSource;
  final SessionLocalDataSource _sessionLocalDataSource;
  final EmployeeRemoteDataSource _employeeRemoteDataSource;
  final TableRemoteDataSource _tableRemoteDataSource;
  final DishRemoteDataSource _dishRemoteDataSource;

  OrderRepositoryImpl({
    required OrderRemoteDataSource orderRemoteDataSource,
    required SessionLocalDataSource sessionLocalDataSource,
    required EmployeeRemoteDataSource employeeRemoteDataSource,
    required TableRemoteDataSource tableRemoteDataSource,
    required DishRemoteDataSource dishRemoteDataSource,
  })
      : _orderRemoteDataSource = orderRemoteDataSource,
        _sessionLocalDataSource = sessionLocalDataSource,
        _employeeRemoteDataSource = employeeRemoteDataSource,
        _tableRemoteDataSource = tableRemoteDataSource,
        _dishRemoteDataSource = dishRemoteDataSource;

  @override
  Future<Either<Failure, List<OrderDto>>> getOrders() async {
    try {
      final restaurant = _sessionLocalDataSource.getRestaurant();

      final orders = await _orderRemoteDataSource.getOrders();
      final employees = await _employeeRemoteDataSource.getEmployeesByRestaurant(restaurant);
      final tables = await _tableRemoteDataSource.getTablesByRestaurantId(restaurant);

      return Right(await buildOrdersWithData(orders, employees, tables));
    }
    catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDto>> getOrderById(int orderId) async {
    try {
      final order = await _orderRemoteDataSource.getOrderById(orderId);
      //final employees = await _employeeRemoteDataSource.getEmployeesByRestaurant(restaurant);
      //final tables = await _tableRemoteDataSource.getTablesByRestaurantId(restaurant);

      return Right(await buildOrderWithData(order, EmployeeModel(), TableModel(), populate: true));
    }
    catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDto>> saveOrder(OrderDto order) async {
    try {
      final response = (order.id == null) ?
        await _orderRemoteDataSource.saveOrder(
          OrderFactory.convertToOrderModel(order),
          _sessionLocalDataSource.getRestaurant()) :
        await _orderRemoteDataSource.updateOrder(
          OrderFactory.convertToOrderModel(order)
        );

      return Right(OrderFactory.convertToOrderDto(response));

    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOrder(int orderId) async {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrderDishDto>> saveOrderDish(OrderDishDto orderDish) async {
    try {
      final response = await _orderRemoteDataSource.saveOrderDish(
        OrderFactory.convertToOrderDishModel(orderDish)
      );

      return Right(OrderFactory.convertToOrderDishDto(response));

    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOrderDish(int orderDishId) async {
    try {
      final response = await _orderRemoteDataSource.deleteOrderDish(orderDishId);
      return Right(response);

    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  Future<List<OrderDto>> buildOrdersWithData(
      List<OrderModel> ordersModel,
      List<EmployeeModel> employeesModel,
      List<TableModel> tablesModel
  ) async {
    List<OrderDto> orders = [];

    for(OrderModel orderModel in ordersModel) {
      orders.add(await buildOrderWithData(
          orderModel,
          employeesModel.firstWhere((e) => e.id == orderModel.waiterId!),
          tablesModel.firstWhere((e) => e.id == orderModel.tableId!)));
    }

    return orders;
  }

  Future<OrderDto> buildOrderWithData(
      OrderModel orderModel,
      EmployeeModel employeeModel,
      TableModel tableModel, { bool populate = false }
  ) async {
    OrderDto order = OrderFactory.convertToOrderDto(orderModel);

    // Complete data with employee
    order.employee = EmployeeFactory.convertToEmployeeDto(employeeModel);

    // Complete data with table
    order.table = TableFactory.convertToTableDto(tableModel);

    // Only populate when flag is true
    if (populate) {
      final dishes = await _orderRemoteDataSource.getOrderDishesByOrder(order.id!);
      order.orderDishes = await buildOrderDishesWithData(dishes);
    }

    return order;
  }

  Future<List<OrderDishDto>> buildOrderDishesWithData(List<OrderDishModel> orderDishesModel) async {
    List<OrderDishDto> orderDishes = [];

    for(OrderDishModel orderDishModel in orderDishesModel) {
      orderDishes.add(await buildOrderDishWithData(orderDishModel));
    }

    return orderDishes;
  }

  Future<OrderDishDto> buildOrderDishWithData(OrderDishModel orderDishModel) async {
    OrderDishDto orderDish = OrderFactory.convertToOrderDishDto(orderDishModel);
    // Get dish from remote
    final dish = await _dishRemoteDataSource.getDishById(orderDish.id!);

    orderDish.dish = DishFactory.convertToDishDto(dish);

    return orderDish;
  }
}