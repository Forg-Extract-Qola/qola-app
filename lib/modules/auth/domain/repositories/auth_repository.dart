import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/auth/domain/dtos/login_dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> adminLogin(LoginDto login);
  Future<Either<Failure, bool>> employeeLogin(LoginDto login);
  String getInitialPage();
}