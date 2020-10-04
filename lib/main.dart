import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.5;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Text(
            'data',
            style: TextStyle(fontSize: 50),
          ),
          Text(
            'data',
            style: TextStyle(fontSize: 50),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/bg.svg',
                    alignment: Alignment.bottomCenter,
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Text(
                      'data',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // body: Stack(
      //   children: <Widget>[
      //     Positioned(
      //       bottom: -40,
      //       right: -15,
      //       width: width,
      //       child: ClipPath(
      //         clipper: EllipseClipper3(),
      //         child: Container(
      //           // width: width * 0.99,
      //           color: Color.fromRGBO(23, 116, 95, 0.149),
      //           height: height,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: -40,
      //       left: 0,
      //       width: width,
      //       child: ClipPath(
      //         clipper: EllipseClipper2(),
      //         child: Container(
      //           // width: width * 0.99,
      //           color: Color.fromRGBO(23, 116, 95, 0.149),
      //           height: height,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: -50,
      //       left: 0,
      //       width: width,
      //       child: ClipPath(
      //         clipper: EllipseClipper(),
      //         child: Container(
      //           // width: width * 0.99,
      //           color: Color.fromRGBO(23, 116, 95, 0.149),
      //           height: height,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: -20,
      //       width: width + 60,
      //       height: height,
      //       child: ClipPath(
      //         clipper: BezierClipper(),
      //         child: Container(
      //           color: Color.fromRGBO(23, 116, 95, 1),
      //           height: height,
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         // width: width * 0.99,
      //         color: Color.fromRGBO(10, 116, 95, 1),
      //         height: height * 0.55,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 500;
    path.lineTo(9.524 * _xScaling, 205.456 * _yScaling);
    path.cubicTo(
      -8.918000000000001 * _xScaling,
      153.16199999999998 * _yScaling,
      33.281 * _xScaling,
      106.75099999999999 * _yScaling,
      90.973 * _xScaling,
      119.008 * _yScaling,
    );
    path.cubicTo(
      157.36 * _xScaling,
      138.798 * _yScaling,
      163.851 * _xScaling,
      162.07299999999998 * _yScaling,
      199.67000000000002 * _xScaling,
      180.44799999999998 * _yScaling,
    );
    path.cubicTo(
      222.54700000000003 * _xScaling,
      192.18399999999997 * _yScaling,
      265.21000000000004 * _xScaling,
      184.48899999999998 * _yScaling,
      320.408 * _xScaling,
      168.49899999999997 * _yScaling,
    );
    path.cubicTo(
      379.96500000000003 * _xScaling,
      151.05499999999998 * _yScaling,
      397.404 * _xScaling,
      188.82299999999998 * _yScaling,
      452.607 * _xScaling,
      194.62399999999997 * _yScaling,
    );
    path.cubicTo(
      547.0350000000001 * _xScaling,
      201.86999999999998 * _yScaling,
      601.76 * _xScaling,
      163.77399999999997 * _yScaling,
      651.139 * _xScaling,
      108.56099999999996 * _yScaling,
    );
    path.cubicTo(
      688.903 * _xScaling,
      69.33299999999997 * _yScaling,
      756.5120000000001 * _xScaling,
      84.49999999999997 * _yScaling,
      781.219 * _xScaling,
      136.79199999999997 * _yScaling,
    );
    path.cubicTo(
      849.5160000000001 * _xScaling,
      261.70899999999995 * _yScaling,
      663.283 * _xScaling,
      397.96299999999997 * _yScaling,
      551.437 * _xScaling,
      447.37399999999997 * _yScaling,
    );
    path.cubicTo(
      375.676 * _xScaling,
      530.207 * _yScaling,
      57.477 * _xScaling,
      395.738 * _yScaling,
      8.051 * _xScaling,
      203.992 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class EllipseClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 700;
    path.lineTo(155.313 * _xScaling, 47.259 * _yScaling);
    path.cubicTo(
      85.104 * _xScaling,
      47.259 * _yScaling,
      24.982 * _xScaling,
      73.901 * _yScaling,
      0 * _xScaling,
      111.698 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      111.698 * _yScaling,
      0 * _xScaling,
      189.862 * _yScaling,
      0 * _xScaling,
      189.862 * _yScaling,
    );
    path.cubicTo(
      24.982 * _xScaling,
      227.66 * _yScaling,
      85.104 * _xScaling,
      254.3 * _yScaling,
      155.313 * _xScaling,
      254.3 * _yScaling,
    );
    path.cubicTo(
      247.92499999999998 * _xScaling,
      254.3 * _yScaling,
      323.00199999999995 * _xScaling,
      207.952 * _yScaling,
      323.00199999999995 * _xScaling,
      150.779 * _yScaling,
    );
    path.cubicTo(
      323.00199999999995 * _xScaling,
      93.606 * _yScaling,
      247.925 * _xScaling,
      47.259 * _yScaling,
      155.313 * _xScaling,
      47.259 * _yScaling,
    );
    path.cubicTo(
      155.313 * _xScaling,
      47.259 * _yScaling,
      155.313 * _xScaling,
      47.259 * _yScaling,
      155.313 * _xScaling,
      47.259 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class EllipseClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 500;
    path.lineTo(0 * _xScaling, 153.031 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      153.031 * _yScaling,
      234 * _xScaling,
      153.031 * _yScaling,
      234 * _xScaling,
      153.031 * _yScaling,
    );
    path.cubicTo(
      234 * _xScaling,
      153.031 * _yScaling,
      301.579 * _xScaling,
      38.70200000000001 * _yScaling,
      8.689999999999998 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      8.689999999999998 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      153.031 * _yScaling,
      0 * _xScaling,
      153.031 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      153.031 * _yScaling,
      0 * _xScaling,
      153.031 * _yScaling,
      0 * _xScaling,
      153.031 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class EllipseClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 800;
    final double _yScaling = size.height / 500;
    path.lineTo(580.559 * _xScaling, 38.653 * _yScaling);
    path.cubicTo(
      465.714 * _xScaling,
      18.18 * _yScaling,
      343.395 * _xScaling,
      80.616 * _yScaling,
      346.332 * _xScaling,
      161.665 * _yScaling,
    );
    path.cubicTo(
      349.08299999999997 * _xScaling,
      237.567 * _yScaling,
      460.465 * _xScaling,
      283.74199999999996 * _yScaling,
      568.914 * _xScaling,
      259.106 * _yScaling,
    );
    path.cubicTo(
      649.941 * _xScaling,
      240.69899999999998 * _yScaling,
      694.11 * _xScaling,
      192.60399999999998 * _yScaling,
      698.491 * _xScaling,
      149.22899999999998 * _yScaling,
    );
    path.cubicTo(
      703.094 * _xScaling,
      103.653 * _yScaling,
      664.462 * _xScaling,
      53.61 * _yScaling,
      580.559 * _xScaling,
      38.653 * _yScaling,
    );
    path.cubicTo(
      580.559 * _xScaling,
      38.653 * _yScaling,
      580.559 * _xScaling,
      38.653 * _yScaling,
      580.559 * _xScaling,
      38.653 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
