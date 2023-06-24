import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocationfromMapBloc
    extends Bloc<LocationfromMapEvent, LocationfromMapState> {
  @override
  LocationfromMapState get initialState => InitialLocationfromMapState();

  @override
  Stream<LocationfromMapState> mapEventToState(
    LocationfromMapEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
