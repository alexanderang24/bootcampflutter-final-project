import 'dart:async';
import 'dart:convert';

import 'package:cryptotracker/models/coin_model.dart';
import 'package:cryptotracker/state_management/event_manager.dart';
import 'package:http/http.dart' as http;

class CoinBloc {
  List<CoinModel> _coinModel;

  final _coinStateController = StreamController<List<CoinModel>>.broadcast();
  Stream<List<CoinModel>> get coin => _coinStateController.stream;

  final _coinEventController = StreamController<EventManager>();
  Sink<EventManager> get coinEventSink => _coinEventController.sink;

  CoinBloc() {
    _coinEventController.stream.listen(_mapEventTotState);
  }

  void _mapEventTotState(EventManager event) async {
    print("event triggered");
    _coinModel = null;
    _coinModel = await getPrice();
    print("refreshed with new data: " + _coinModel[0].price);
    _coinStateController.sink.add(_coinModel);
  }

  void dispose() {
    _coinEventController.close();
    _coinStateController.close();
  }

  clearModel() {
    _coinModel = null;
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
