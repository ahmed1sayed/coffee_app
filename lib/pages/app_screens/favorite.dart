import 'package:flutter/material.dart';
class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container (
        color: Colors.orange,
        height: 200,
        child:  const Text('dfhytjty'),),
    );
  }
}
