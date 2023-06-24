import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ayyah_ride_customer/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';

import './bloc.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  CreditCardState get initialState => InitialCreditCardState();

  @override
  Stream<CreditCardState> mapEventToState(
    CreditCardEvent event,
  ) async* {
    //Loading indicator for something going to change
    yield LoadingCreditCardState();

    if (await _repo.networkInfo.isConnected) {
      if (event is ClickOnDeleteEvent) {
        try {
          yield ShowDeleteCardState();
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
