import 'package:cryptotracker/pages/login.dart';
import 'package:cryptotracker/state_management/coin_bloc.dart';
import 'package:cryptotracker/utils/side_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Coins extends StatefulWidget {
  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  final _bloc = CoinBloc();
  String priceBtc;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _bloc.getPrice();
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
                  return Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: Color(0xff3853a2),
                        indent: 20,
                        endIndent: 20,
                        height: 10,
                      ),
                      ListTile(
                        title: Text(snapshot.data[i].name),
                        subtitle: Text(snapshot.data[i].symbol),
                        trailing: Text(snapshot.data[i].price + " USD"),
                        leading: Image.asset(snapshot.data[i].image),
                      ),
                    ],
                  );
                },
              );
            }
          },
          future: _bloc.getPrice(),
        ),
      ),
    );
  }
}
