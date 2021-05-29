import 'package:cryptotracker/models/news_model.dart';
import 'package:flutter/material.dart';

class SecondaryCard extends StatelessWidget {
  final NewsModel news;
  SecondaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Color(0xff3853a2), width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: NetworkImage(news.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 4.0),
                  Text(
                    news.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(news.time,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          )),
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
            ),
          )
        ],
      ),
    );
  }
}
