import 'package:animals_app/models/animals_model.dart';
import 'package:animals_app/values/styles.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatefulWidget {
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Hero(
          tag: 'background-${widget.animal.name}',
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: widget.animal.colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
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
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'image-${widget.animal.picture}',
                    child: Image.asset(widget.animal.picture,
                        height: screenHeight * 0.45),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Hero(
                    tag: 'name-${widget.animal.name}',
                    child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child: Text(widget.animal.name,
                                style: AppTheme.heading)))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 8, 16),
                child: Hero(
                    tag: 'description-${widget.animal.name}',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(widget.animal.description,
                            style: AppTheme.subHeading),
                      ),
                    )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
