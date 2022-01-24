import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

import 'sealed_bloc_builder.dart';

// This file has an example of using SealedBlocBuilder

/// State
class MyState extends Union4Impl<InitialState, LoadingState, MySuccessState,
    FailureState> {
  static final unions =
      const Quartet<InitialState, LoadingState, MySuccessState, FailureState>();

  MyState._(
      Union4<InitialState, LoadingState, MySuccessState, FailureState> union)
      : super(union);

  factory MyState.initial() => MyState._(unions.first(InitialState()));

  factory MyState.loading() => MyState._(unions.second(LoadingState()));

  factory MyState.success({required String data}) =>
      MyState._(unions.third(MySuccessState(data: data)));

  factory MyState.failure({required String error}) =>
      MyState._(unions.fourth(FailureState(error: error)));
}

class MySuccessState {
  final String data;
  //..
  //..
  //..
  //..

  MySuccessState({required this.data});
}

/// Cubit
class MyCubit extends Cubit<MyState> {
  MyCubit(MyState initialState) : super(initialState);
}

/// View
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SealedBlocBuilder<MyCubit, MyState, MySuccessState>(
      initial: (state) => Text("Initial"),
      loading: (state) => CircularProgressIndicator(),
      success: (state) => Text("Success" + state.data),
      failure: (state) => Text("Failure"),
    );
  }
}
