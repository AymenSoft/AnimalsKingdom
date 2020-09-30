import 'package:animals_app/values/styles.dart';
import 'package:animals_app/widgets/animal_widget.dart';
import 'package:flutter/material.dart';

class AnimalsList extends StatefulWidget {
  @override
  _AnimalsListState createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 8),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Animals Kingdom", style: AppTheme.display1),
                  TextSpan(text: "\n", style: AppTheme.display1),
                  TextSpan(text: "Animals", style: AppTheme.display2),
                ]),
              ),
            ),
            Expanded(
              child: AnimalWidget(),
            )
          ],
        ),
      ),
    );
  }
}
