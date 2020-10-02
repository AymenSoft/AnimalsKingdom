import 'package:animals_app/models/animals_model.dart';
import 'package:animals_app/values/styles.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatefulWidget {

  final double _expandedBottomSheet = 0;
  final double _collapsedBottomSheet = -250;
  final double _fullCollapsedBottomSheet = -330;

  final AnimalsModel animal;

  const AnimalDetails({Key key, this.animal}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimalDetailsScreenState();
  }
}

class _AnimalDetailsScreenState extends State<AnimalDetails> {

  double _currentButtomSheet = -250;
  bool isCollapsed = false;

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
                    Future.delayed(const Duration(milliseconds: 250) , () {
                      setState(() {
                        _currentButtomSheet = widget._fullCollapsedBottomSheet;
                      });
                    });
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
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          bottom: _currentButtomSheet,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: _onTap,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    height: 80,
                    child: Text(
                      "Clips",
                      style: AppTheme.subHeading.copyWith(
                          color: Colors.black),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _clipsWidget(),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }


  _onTap(){
    setState(() {
      _currentButtomSheet = isCollapsed ? widget._expandedBottomSheet : widget._collapsedBottomSheet;
      isCollapsed = !isCollapsed;
    });
  }

  Widget _clipsWidget() {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              roundedContainer(Colors.redAccent),
              SizedBox(height: 20,),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(height: 20,),
              roundedContainer(Colors.purple),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.grey),
              SizedBox(height: 20,),
              roundedContainer(Colors.blueGrey),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.lightGreenAccent),
              SizedBox(height: 20,),
              roundedContainer(Colors.pinkAccent),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.deepOrange),
              SizedBox(height: 20,),
              roundedContainer(Colors.lightBlueAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _currentButtomSheet = widget._collapsedBottomSheet;
      });
    });
  }
}

