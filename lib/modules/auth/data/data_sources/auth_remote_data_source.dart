import 'dart:convert';

import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/auth/data/models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginModel login);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final HttpProvider _httpProvider;

  AuthRemoteDataSourceImpl({
    required HttpProvider httpProvider
  }) :
    _httpProvider = httpProvider;

  @override
  Future<LoginModel> login(LoginModel login) async {
    final response = await _httpProvider.post('$BASE_URL/manager/sign-in', jsonEncode(login.toJson()));
    return LoginModel.fromJson(response ?? {});
  }
}
