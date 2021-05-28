import 'dart:async';

import 'package:cryptotracker/models/coin_model.dart';
import 'package:cryptotracker/state_management/event_manager.dart';

class BlocCounter {
  CoinModel _coinModel;

  final _counterStateController = StreamController<CoinModel>();
  Stream<CoinModel> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<EventManager>();
  Sink<EventManager> get counterEventSink => _counterEventController.sink;

  BlocCounter() {
    _counterEventController.stream.listen(_mapEventTotState);
  }

  void _mapEventTotState(EventManager event) {
    print("bloc triggered");
    _coinModel = CoinModel(name: "Bitcoin", symbol: "BTC", price: "\$40,000.000");
    print("bloc coin model: " + _coinModel.toString());

    _counterStateController.sink.add(_coinModel);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
