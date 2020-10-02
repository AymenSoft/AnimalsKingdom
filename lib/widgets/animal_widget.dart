import 'package:animals_app/models/animals_model.dart';
import 'package:animals_app/screens/animal_details.dart';
import 'package:animals_app/values/styles.dart';
import 'package:flutter/material.dart';

class AnimalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1200),
            pageBuilder: (context, _, __) => AnimalDetails(animal: animalsModel[0])
        ));
      },
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Hero(
              tag: 'background-${animalsModel[0].name}',
              child: Container(
                width: 0.9 * screenWidth,
                height: 0.6 * screenHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: animalsModel[0].colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.5),
          child: Hero(
            tag: 'image-${animalsModel[0].picture}',
            child: Image.asset(
              animalsModel[0].picture,
              height: screenHeight * 0.55,
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
                  tag: 'name-${animalsModel[0].name}',
                  child: Material(
                      color: Colors.transparent,
                      child: Container(
                          child: Text(animalsModel[0].name,
                              style: AppTheme.heading)))),
              Hero(
                  tag: 'description-${animalsModel[0].description}',
                  child: Material(
                      color: Colors.transparent,
                      child: Container(
                          child: Text('Tap to read more',
                              style: AppTheme.subHeading))))
            ],
          ),
        )
      ]),
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
