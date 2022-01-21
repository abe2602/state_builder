import 'package:flutter/material.dart';

class ResponseStateBuilder<Loading, Error, Success> extends StatelessWidget {
  const ResponseStateBuilder({
    required this.stream,
    required this.successWidgetBuilder,
    required this.errorWidgetBuilder,
    this.loadingWidgetBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(Success success) successWidgetBuilder;
  final Widget Function(Error error) errorWidgetBuilder;
  final Stream stream;
  final Widget Function()? loadingWidgetBuilder;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: stream.where(
            (event) => event is Loading || event is Error || event is Success,
          ),
        builder: (_, snapshot) {
          final state = snapshot.data;

          if (state == null || state is Loading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is Error) {
            return errorWidgetBuilder(state as Error);
          } else if (state is Success) {
            return successWidgetBuilder(state as Success);
          }

          throw UnknownStateTypeException();
        },
      );
}

class UnknownStateTypeException implements Exception {}
