import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

class InitialState {}

class LoadingState {}

class FailureState {
  String error;

  FailureState({required this.error});
}

class SealedBlocBuilder<Bloc extends bloc.BlocBase<State>,
        State extends Union4<InitialState, LoadingState, S, FailureState>, S>
    extends SealedBlocBuilder4<Bloc, State, InitialState, LoadingState, S,
        FailureState> {
  const SealedBlocBuilder({
    Key? key,
    Bloc? bloc,
    required Widget Function(InitialState) initial,
    required Widget Function(LoadingState) loading,
    required Widget Function(S) success,
    required Widget Function(FailureState) failure,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(
            key: key,
            bloc: bloc,
            buildWhen: buildWhen,
            initial: initial,
            loading: loading,
            success: success,
            failure: failure);

   //Todo
   //Add factory with optinal arguments         
}

class SealedBlocBuilder4<
    Bloc extends bloc.BlocBase<State>,
    State extends Union4<I, L, S, F>,
    I,
    L,
    S,
    F> extends BlocBuilderBase<Bloc, State> {
  const SealedBlocBuilder4({
    Key? key,
    Bloc? bloc,
    required this.initial,
    required this.loading,
    required this.success,
    required this.failure,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(key: key, bloc: bloc, buildWhen: buildWhen);

  final Widget Function(I) initial;
  final Widget Function(L) loading;
  final Widget Function(S) success;
  final Widget Function(F) failure;

  @override
  Widget build(BuildContext context, State state) {
    return state.join(initial, loading, success, failure);
  }
}
