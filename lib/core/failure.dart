import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

final class FailureError extends Failure {
  const FailureError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

final class FailureNetwork extends Failure {
  const FailureNetwork({required this.error});

  final String error;

  @override
  List<Object?> get props => [];
}
