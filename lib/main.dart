import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  int _autoclickNumbers = 1;
  int _bonusMultiplicator = 1;

  String _ferrariImageName(){
    if(_counter < 10){
      return "images/dino.png";
    }else if(_counter < 100){
      return "images/250GTO.png";
    }else if(_counter < 500) {
      return "images/testarossa.png";
    }else if(_counter < 1000) {
      return "images/360modena.png";
    }else if(_counter < 5000){
      return "images/enzo.png";
    }else if(_counter < 10000){
      return "images/812superfast.png";
    }else if(_counter < 50000){
      return "images/F40.png";
    }else if(_counter < 100000){
      return "images/laFerrari.png";
    }else if(_counter < 50000) {
      return "images/458Italia.png";
    }
    return "images/monza.png";
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  void _autoclick(){
    setState(() {
      var cost = 50 * _autoclickNumbers;
      if(_counter >= cost){
        _counter = _counter - cost;
        _autoclickNumbers++;
      }
    });
  }

  void _autoclickTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter = _counter + (_autoclickNumbers - 1);
      });
    });
  }

  void _buyBonusMultiplicator(){
    setState(() {
      var cost = 100 * _bonusMultiplicator;
      if(_counter >= cost){
        _counter = _counter - cost;
        _bonusMultiplicator++;
      }
    });
  }

  void _initGame() async{
    _autoclickTimer();
}

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'HorsePower :',
                style: GoogleFonts.domine(
                  textStyle: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '$_counter',
                style: GoogleFonts.domine(
                    textStyle: TextStyle(color: HexColor("#FF0000"), fontSize: 70, fontWeight: FontWeight.bold)),
              ),

              TextButton(
                onPressed:_incrementCounter,
                child:Image.asset(_ferrariImageName()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Column(
                    children: [
                      TextButton(
                      onPressed:_autoclick,
                      child:Image.asset("images/cursor.png",height:80,width:80,),
                    ),
                      Text(
                          '${_autoclickNumbers}/s : ${_autoclickNumbers*100} HP',
                          style: GoogleFonts.domine(
                            textStyle: TextStyle(color:Colors.white, fontSize:20,),
                          )
                      ),
                    ],
                  ),
                  SizedBox(width:60,),
                  Column(
                    children: [
                      TextButton(
                      onPressed:_buyBonusMultiplicator,
                      child:Image.asset("images/pointer.png",height:80,width:80,),
                    ),
                      Text(
                          'X${_bonusMultiplicator} : ${_bonusMultiplicator*100} HP',
                          style: GoogleFonts.domine(
                            textStyle:TextStyle(color:Colors.white, fontSize:20,),
                          )
                      ),
                    ],
                  )
                ],
              )


            ],
          ) /* add child content here */,
        ),
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
