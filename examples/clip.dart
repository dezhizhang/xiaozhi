
import 'package:flutter/material.dart';

class ClipPage extends StatefulWidget{
  _ClipPage createState() =>_ClipPage();
}

class _ClipPage extends State<ClipPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('clip'),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: ClipWeight(),
            child: Container(
              color: Colors.pink,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}

class ClipWeight extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControllPoint = Offset(size.width / 2,size.height);
    var endControllPoint = Offset(size.width,size.height - 50);

    path.quadraticBezierTo(
      firstControllPoint.dx,
      firstControllPoint.dy,
      endControllPoint.dx,
      endControllPoint.dy,
    );
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}