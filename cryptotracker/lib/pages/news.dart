import 'package:cryptotracker/models/coin_model.dart';
import 'package:cryptotracker/models/news_model.dart';
import 'package:cryptotracker/pages/login.dart';
import 'package:cryptotracker/state_management/bloc_counter.dart';
import 'package:cryptotracker/state_management/event_manager.dart';
import 'package:cryptotracker/utils/coin_card.dart';
import 'package:cryptotracker/utils/primary_card.dart';
import 'package:cryptotracker/utils/secondary_card.dart';
import 'package:cryptotracker/utils/side_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final _bloc = BlocCounter();

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
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
          ),
        ],
        backgroundColor: Color(0xff3853a2),
      ),
      drawer: SideDrawer(),
      body: ListView(
        children: [
          // Crypto News
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "CRYPTO NEWS",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff3853a2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 300.0,
            padding: EdgeInsets.only(left: 20.0),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var news = popularList[index];
                return InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 12.0),
                    child: PrimaryCard(news: news),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 25.0),
          // Trending Coins
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  "TRENDING COINS",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff3853a2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30),
                TextButton.icon(
                  onPressed: () {
                    _bloc.counterEventSink.add(IncrementEvent());
                  },
                  icon: Icon(Icons.refresh, color: Colors.white),
                  label: Text("Refresh", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 125.0,
            padding: EdgeInsets.only(left: 20.0),
            child: StreamBuilder(
              stream: _bloc.counter,
              initialData: new CoinModel(name: "Please refresh", symbol: "-", price: "0"),
              builder: (BuildContext context, AsyncSnapshot<CoinModel> snip) {
                print("SNIP: " + snip.data.toString());
                return ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: CoinCard(coinModel: snip.data),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 25.0),
          // Trending News
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "TRENDING NEWS",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff3853a2),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: recentList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              var recent = recentList[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 135.0,
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: SecondaryCard(news: recent),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
