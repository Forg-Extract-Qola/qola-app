import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/auth/domain/dtos/login_dto.dart';
import 'package:qola_app/modules/auth/domain/repositories/auth_repository.dart';

class DoAdminLogin implements UseCase<bool, LoginDto> {

  final AuthRepository _authRepository;

  DoAdminLogin({required  AuthRepository authRepository }) :
    _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call(LoginDto login) async {
    return await _authRepository.adminLogin(login);
  }
}