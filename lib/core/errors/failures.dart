import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({@required this.message});
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
