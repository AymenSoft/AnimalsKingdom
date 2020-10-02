import 'package:animals_app/models/animals_model.dart';
import 'package:animals_app/screens/animal_details.dart';
import 'package:animals_app/values/styles.dart';
import 'package:flutter/material.dart';

class AnimalWidget extends StatelessWidget {

  final AnimalsModel animalsModel;
  final PageController pageController;
  final int currentPage;

  AnimalWidget(this.animalsModel, this.pageController, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1200),
            pageBuilder: (context, _, __) => AnimalDetails(animal: animalsModel)
        ));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child){
          double value = 1;
          if(pageController.position.haveDimensions){
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }
          return Stack(children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Hero(
                  tag: 'background-${animalsModel.name}',
                  child: Container(
                    width: 0.9 * screenWidth,
                    height: 0.6 * screenHeight,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: animalsModel.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Hero(
                tag: 'image-${animalsModel.picture}',
                child: Image.asset(
                  animalsModel.picture,
                  height: screenHeight * 0.55 * value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Hero(
                      tag: 'name-${animalsModel.name}',
                      child: Material(
                          color: Colors.transparent,
                          child: Container(
                              child: Text(animalsModel.name,
                                  style: AppTheme.heading)))),
                  Hero(
                      tag: 'description-${animalsModel.description}',
                      child: Material(
                          color: Colors.transparent,
                          child: Container(
                              child: Text('Tap to read more',
                                  style: AppTheme.subHeading))))
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5,
        0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
