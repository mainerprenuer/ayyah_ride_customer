import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class freeRidesBloc extends Bloc<freeRidesEvent, freeRidesState> {
  @override
  freeRidesState get initialState => InitialfreeRidesState();

  @override
  Stream<freeRidesState> mapEventToState(
    freeRidesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
