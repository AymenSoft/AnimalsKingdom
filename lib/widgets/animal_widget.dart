import 'package:animals_app/models/animals_model.dart';
import 'package:flutter/material.dart';

class AnimalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                width:0.9 * screenWidth,
                height:0.55 * screenHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: animalsModel[0].colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    )
                ),
              ),
            ),
          ),
        ]
    );
  }
}

class BackgroundClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width, size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }

}
