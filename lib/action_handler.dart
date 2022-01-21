import 'package:flutter/material.dart';

class ActionHandler<T> extends StatefulWidget {
  const ActionHandler({
    required this.actionInput,
    required this.actionResult,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Stream<dynamic> actionInput;
  final ValueChanged<dynamic> actionResult;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _ActionHandlerState<T>();
}

class _ActionHandlerState<T> extends State<ActionHandler<T>> {
  @override
  void initState() {
    super.initState();

    widget.actionInput
        .where((action) => action is T)
        .listen(widget.actionResult);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
