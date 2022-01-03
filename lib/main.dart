import 'package:flutter/material.dart';
import 'package:state_builder/action_handler.dart';
import 'package:state_builder/main_bloc.dart';
import 'package:state_builder/main_states.dart';
import 'package:state_builder/response_state_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainBloc bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ActionHandler<MainActions>(
            bloc: bloc,
            actionListener: (state) {
              print(state);
            },
            child: ResponseStateBuilder<Loading, Error, Success>(
              bloc: bloc,
              errorWidgetBuilder: (error) {
                return Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                );
              },
              successWidgetBuilder: (success) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: bloc.changeState,
                        child: Text('Repetir'),
                      ),
                      TextButton(
                        onPressed: bloc.sendAction,
                        child: Text('Enviar Ação'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
