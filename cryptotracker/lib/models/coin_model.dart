import 'dart:convert';

class Coin {
  final String name, symbol, price, image;
  Coin(this.name, this.symbol, this.price, this.image);
}

CoinModel userModelFromJson(String str) => CoinModel.fromJson(json.decode(str));
String userModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  CoinModel({
    this.name,
    this.symbol,
    this.price,
    this.image,
  });
  String name;
  String symbol;
  String price;
  String image;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        name: json["name"],
        symbol: json["symbol"],
        price: double.parse(json["priceUsd"]).toStringAsFixed(3),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "price": price,
      };
}
