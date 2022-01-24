import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionHandler<Action> extends StatelessWidget {
  const ActionHandler({
    required this.bloc,
    required this.actionListener,
    required this.child,
    Key? key,
  }) : super(key: key);

  final BlocBase bloc;
  final ValueChanged<Action> actionListener;
  final Widget child;

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: bloc,
        listenWhen: (_, action) => action is Action,
        listener: (_, action) => actionListener(action as Action),
        child: child,
      );
}
