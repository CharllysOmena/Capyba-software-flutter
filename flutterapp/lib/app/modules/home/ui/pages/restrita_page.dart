import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RestritaPage extends StatefulWidget {
  final String title;
  const RestritaPage({Key? key, this.title = 'RestritaPage'}) : super(key: key);
  @override
  RestritaPageState createState() => RestritaPageState();
}

class RestritaPageState extends State<RestritaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
