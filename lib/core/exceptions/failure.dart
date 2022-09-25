import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ConnectionFailure extends Failure {

  final String? message;

  const ConnectionFailure({this.message});

  @override
  List<Object> get props => [message!];
}

class ServerFailure extends Failure {

  final String? message;

  const ServerFailure({this.message});

  @override
  List<Object> get props => [message!];
}

class CacheFailure extends Failure {

  final String? message;

  const CacheFailure({this.message});

  @override
  List<Object> get props => [message!];
}