import 'package:animals_app/models/animals_model.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatefulWidget{

  final AnimalsModel animal;


  const AnimalDetails({Key key, this.animal}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimalDetailsScreenState();
  }
}

class _AnimalDetailsScreenState extends State<AnimalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.animal.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  )
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ]
      ),
    );
  }
}