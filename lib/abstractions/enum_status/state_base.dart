import 'package:equatable/equatable.dart';

enum Status { initial, loading, loaded, empty, error }

abstract class StateBase extends Equatable {
  StateBase({
    required this.status,
    required this.errorMessage,
  });

  final Status status;
  final String errorMessage;

  @override
  List<Object> get props => [status, errorMessage];

  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() loaded,
    required T Function() empty,
    required T Function() error,
  }) {
    switch (status) {
      case Status.empty:
        return empty.call();
      case Status.error:
        return error.call();
      case Status.loading:
        return loading.call();
      case Status.loaded:
        return loaded.call();
      case Status.initial:
        return initial.call();
      default:
        return error.call();
    }
  }

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function()? loaded,
    T Function()? empty,
    T Function()? error,
    required T Function() orElse,
  }) {
    switch (status) {
      case Status.empty:
        return empty?.call() ?? orElse();
      case Status.error:
        return error?.call() ?? orElse();
      case Status.loading:
        return loading?.call() ?? orElse();
      case Status.loaded:
        return loaded?.call() ?? orElse();
      case Status.initial:
        return initial?.call() ?? orElse();
      default:
        return error?.call() ?? orElse();
    }
  }
}
