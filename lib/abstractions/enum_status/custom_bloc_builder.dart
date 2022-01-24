import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_builder/abstractions/enum_status/state_base.dart';

typedef WhenErrorBlocWidgetBuilder<E> = Widget Function(
    BuildContext context, E error);

typedef WhenLoadingBlocWidgetBuilder = Widget Function(BuildContext context);

class CustomBlocBuilder<C extends Cubit<S>, S extends StateBase>
    extends BlocBuilderBase<C, S> {
  const CustomBlocBuilder({
    Key? key,
    required this.initial,
    required this.success,
    required this.error,
    required this.loading,
    C? cubit,
    BlocBuilderCondition<S>? buildWhen,
  }) : super(key: key, bloc: cubit, buildWhen: buildWhen);

  final BlocWidgetBuilder<S> success;

  final WhenErrorBlocWidgetBuilder<S> error;

  final WhenLoadingBlocWidgetBuilder loading;

  final WhenLoadingBlocWidgetBuilder initial;

  @override
  Widget build(BuildContext context, S state) {
    switch (state.status) {
      case Status.initial:
        return initial(context);
      case Status.loading:
        return loading(context);
      case Status.loaded:
        return success(context, state);
      case Status.error:
        return error(context, state);

      default:
        return SizedBox.shrink();
    }
  }
}
