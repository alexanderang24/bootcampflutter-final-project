import 'dart:ui';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:cryptotracker/pages/login.dart';
import 'package:cryptotracker/pages/side_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
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
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/img/about.jpg"),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: -60,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff3853a2),
                    radius: 75,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/icon/logo.jpg"),
                      radius: 70,
                    ),
                  ),
                )
              ],
            ),
            ListTile(title: Text("Alex"), subtitle: Text("Lead Engineer")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.mail, color: Colors.white),
                  label: Text("Email", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.github, color: Colors.white),
                  label: Text("GitHub", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.gitlab, color: Colors.white),
                  label: Text("GitLab", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.linkedin_square, color: Colors.white),
                  label: Text("LinkedIn", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.medium_monogram, color: Colors.white),
                  label: Text("Medium", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
            ListTile(
              title: Text("Ander"),
              subtitle: Text("Software Engineer"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.mail, color: Colors.white),
                  label: Text("Email", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.github, color: Colors.white),
                  label: Text("GitHub", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.linkedin_square, color: Colors.white),
                  label: Text("LinkedIn", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text("Joseph"),
              subtitle: Text("UI/UX Designer"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(FontAwesome5Brands.figma, color: Colors.white),
                  label: Text("Figma", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.linkedin_square, color: Colors.white),
                  label: Text("LinkedIn", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text("Wang Fei Xiang"),
              subtitle: Text("QA Engineer"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.mail, color: Colors.white),
                  label: Text("Email", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.linkedin_square, color: Colors.white),
                  label: Text("LinkedIn", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(AntDesign.medium_monogram, color: Colors.white),
                  label: Text("Medium", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
                ),
              ],
            ),
            SizedBox(height: 30)
          ],
        ),
      ]),
    );
  }
}
