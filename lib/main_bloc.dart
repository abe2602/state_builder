import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_builder/main_states.dart';

class MainBloc extends Cubit<MainStates> {
  MainBloc() : super(Idle()) {
    changeState();
  }

  void changeState() {
    emit(Idle());

    Future.delayed(
      const Duration(milliseconds: 5000),
      () {
        emit(Error());
      },
    );

    Future.delayed(
      const Duration(milliseconds: 6500),
          () {
        emit(Success());
      },
    );
  }

  void sendAction() {
     emit(NavigateToNextPage());
  }
}
