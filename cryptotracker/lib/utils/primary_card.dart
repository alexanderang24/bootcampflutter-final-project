import 'package:cryptotracker/models/news_model.dart';
import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final NewsModel news;
  PrimaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Color(0xff3853a2), width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5.0,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 10.0),
              Text(news.category,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: Hero(
              tag: news.category,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                news.time,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10.0),
              CircleAvatar(
                radius: 5.0,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 10.0),
              Text(
                "${news.estimate} min read",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
