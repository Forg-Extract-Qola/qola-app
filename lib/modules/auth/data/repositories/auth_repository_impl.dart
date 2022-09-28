
import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/utils/helper.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/auth/data/models/login_model.dart';
import 'package:qola_app/modules/auth/domain/dtos/login_dto.dart';
import 'package:qola_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:qola_app/routes.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource _authRemoteDataSource;
  final SessionLocalDataSource _sessionLocalDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required SessionLocalDataSource sessionLocalDataSource
  }):
    _authRemoteDataSource = authRemoteDataSource,
    _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<Either<Failure, bool>> adminLogin(LoginDto login) async {
    try {
      final response = await _authRemoteDataSource.login(LoginModel(email: login.email, password: login.password));
      if (response.token == null) return const Left(ServerFailure(message: errorNoTokenMessage));

      _sessionLocalDataSource.saveToken(response.token!);

      return const Right(true);
    }
    catch (e) {
      return const Left(ServerFailure(message: errorInvalidCredentialsMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> employeeLogin(LoginDto login) {
    // TODO: implement employeeLogin
    throw UnimplementedError();
  }

  @override
  String getInitialPage() {
    final token = _sessionLocalDataSource.getToken();
    if (!Helper.isNullOrEmpty(token)) return RoutesPath.mainAdminPath;
    return RoutesPath.homeAuthPath;
  }
}