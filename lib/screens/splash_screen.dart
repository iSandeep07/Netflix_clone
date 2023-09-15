import 'dart:async';


import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override

  void dispose(){
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(animation: _controller,
                child : Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Image.asset('assets/netflix2.png' , fit: BoxFit.cover ,height: 200,filterQuality: FilterQuality.high,),
                    ),
                  ),
                ) ,
                builder: (BuildContext context , Widget? child){
                  return Transform.rotate(angle: _controller.value * 2.0 * math.pi ,
                    child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * .08),

          ],
        ),
      ),
    );
  }
}
