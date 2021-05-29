import 'package:cryptotracker/models/coin_model.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final CoinModel coinModel;
  CoinCard({this.coinModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Color(0xff3853a2), width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.0),
          Text(
            coinModel.name,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            coinModel.symbol,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            coinModel.price,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
