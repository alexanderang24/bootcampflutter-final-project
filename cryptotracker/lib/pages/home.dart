import 'package:cryptotracker/models/coin_model.dart';
import 'package:cryptotracker/models/news_model.dart';
import 'package:cryptotracker/pages/login.dart';
import 'package:cryptotracker/state_management/coin_bloc.dart';
import 'package:cryptotracker/state_management/event_manager.dart';
import 'package:cryptotracker/utils/coin_card.dart';
import 'package:cryptotracker/utils/primary_card.dart';
import 'package:cryptotracker/utils/secondary_card.dart';
import 'package:cryptotracker/utils/side_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _bloc = CoinBloc();

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
                    _bloc.coinEventSink.add(ReadEvent());
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
              stream: _bloc.coin,
              initialData: null,
              builder: (context, snapshot) {
                return FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(child: Text("Loading...")),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(right: 12.0),
                                  child: CoinCard(coinModel: snapshot.data[i]),
                                ),
                              );
                            });
                      }
                    },
                    future: _bloc.getPrice());
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
