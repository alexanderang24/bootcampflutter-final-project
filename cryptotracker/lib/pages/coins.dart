import 'dart:convert';

import 'package:cryptotracker/model/coin_model.dart';
import 'package:cryptotracker/pages/login.dart';
import 'package:cryptotracker/pages/side_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Coins extends StatefulWidget {
  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  String priceBtc;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  getPrice() async {
    var items = [
      "bitcoin",
      "ethereum",
      "binance-coin",
      // "cardano",
      // "xrp",
      // "dogecoin",
      // "polkadot",
      // "solana",
      // "tron",
      // "monero",
      // "pancakeswap",
      // "bakerytoken",
    ];
    List<CoinModel> coinList = [];

    for (var item in items) {
      var response = await http.get(Uri.parse("https://api.coincap.io/v2/assets/$item"));
      var data = jsonDecode(response.body)["data"];
      CoinModel coin = CoinModel.fromJson(data);
      coinList.add(coin);
    }
    return coinList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      getPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print("Current user: " + auth.currentUser.email);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Coins"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _signOut().then(
                  (value) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
        backgroundColor: Color(0xff3853a2),
      ),
      drawer: SideDrawer(),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text("Loading...")),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Coin", style: TextStyle(fontSize: 20)),
                          Text("Price", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    );
                  }
                  i--;
                  return ListTile(
                    title: Text(snapshot.data[i].name),
                    subtitle: Text(snapshot.data[i].symbol),
                    trailing: Text(snapshot.data[i].price),
                  );
                },
              );
            }
          },
          future: getPrice(),
        ),
      ),
    );
  }
}
