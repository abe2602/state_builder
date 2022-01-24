import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_builder/abstractions/enum_status/state_base.dart';

import 'custom_bloc_builder.dart';

class MyState extends StateBase {
  MyState(
      {required this.name,
      required Status status,
      required String errorMessage})
      : super(status: Status.initial, errorMessage: errorMessage);

  final String name;

  MyState copyWith({Status? status, String? errorMessage, String? name}) {
    return MyState(
        errorMessage: errorMessage ?? this.errorMessage,
        name: name ?? this.name,
        status: status ?? this.status);
  }
}

class MyCubit extends Cubit<MyState> {
  MyCubit(MyState initialState) : super(initialState);
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<MyCubit, MyState>(
      error: (__, StateBase error) => Text("Error"),
      loading: (_) => Text("Loading"),
      initial: (_) => Text("Initial"),
      success: (_, StateBase state) => Text("Success"),
    );
  }
}
