import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_demo/homepage.dart';
import 'package:list_demo/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height,
         _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body:Center(
        child:
          Column(
            children: [
              SizedBox(height: _height*0.2,),
              Stack(
                children: [

                  Image.asset("assets/splash/blue.png"),
                  Image.asset("assets/splash/red-500x500.png"),
                  Image.asset("assets/splash/purple-500x500.png"),
                  Positioned(height: _height*0.3,left: _width*0.2,top: _width*0.15,
                      child: Image.asset("assets/splash/logo.png")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:75),
                child: Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  child: RaisedButton(color: Colors.white,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return MyHomePage();
                      }));


                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple,
                                Colors.lightBlueAccent
                              ]
                          ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Container(alignment: Alignment.center,
                        constraints: BoxConstraints(maxWidth: _width*0.75,minHeight: _height*.075),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Continue",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
      )

    );
  }
}
