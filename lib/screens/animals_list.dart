import 'package:animals_app/models/animals_model.dart';
import 'package:animals_app/values/styles.dart';
import 'package:animals_app/widgets/animal_widget.dart';
import 'package:flutter/material.dart';

class AnimalsList extends StatefulWidget {
  @override
  _AnimalsListState createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {

  PageController _pageController;
  int currentPage = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }

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
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  for (var i = 0; i < animalsModel.length; i++)
                    AnimalWidget(animalsModel[i], _pageController, i)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
