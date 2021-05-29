import 'dart:async';
import 'dart:convert';

import 'package:cryptotracker/models/coin_model.dart';
import 'package:cryptotracker/state_management/event_manager.dart';
import 'package:http/http.dart' as http;

class CoinBloc {
  List<CoinModel> _coinModel;

  final _counterStateController = StreamController<List<CoinModel>>();
  Stream<List<CoinModel>> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<EventManager>();
  Sink<EventManager> get counterEventSink => _counterEventController.sink;

  CoinBloc() {
    _counterEventController.stream.listen(_mapEventTotState);
  }

  void _mapEventTotState(EventManager event) async {
    print("bloc triggered");
    // _coinModel = CoinModel(name: "Bitcoin", symbol: "BTC", price: "\$40,000.000");

    _coinModel = await getPrice();
    print("bloc coin model: " + _coinModel.toString());

    _counterStateController.sink.add(_coinModel);
    print("bloc completed");
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }

  getPrice() async {
    var items = [
      "bitcoin",
      "ethereum",
      "binance-coin",
      "cardano",
      "xrp",
      "dogecoin",
      "polkadot",
      "solana",
      "tron",
      "pancakeswap",
    ];
    List<CoinModel> coinList = [];

    for (var item in items) {
      var response = await http.get(Uri.parse("https://api.coincap.io/v2/assets/$item"));
      var data = jsonDecode(response.body)["data"];
      CoinModel coin = CoinModel.fromJson(data);
      coin.image = "assets/icon/$item.png";
      coinList.add(coin);
    }
    return coinList;
  }
}
