import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';

import 'package:just_audio/just_audio.dart';

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
  int _counter = 0;
  int _autoclickNumbers = 1;
  int _bonusMultiplicatorNumbers = 1;


  bool _playDinoSound = true;
  bool _play458ItaliaSound = true;
  bool _playTestarossaSound = true;
  bool _play360modenaSound = true;
  bool _playEnzoSound = true;
  bool _play812SuperfastSound = true;
  bool _playF40Sound = true;
  bool _playLaFerrariSound = true;
  bool _play250GTOSound = true;
  bool _playMonzaSound = true;



  _ferrariImageName(){
    if(_counter < 10){
      if(_playDinoSound){
        _playDinoSound = false;
        _playDino();
      }
      return "images/dino.png";
    }else if(_counter < 100){
      if(_play458ItaliaSound){
        _play458ItaliaSound = false;
        _play458Italia();
      }
      return "images/458Italia.png";
    }else if(_counter < 500) {
      if(_playTestarossaSound){
        _playTestarossaSound = false;
        _playTestarossa();
      }
      return "images/testarossa.png";
    }else if(_counter < 1000) {
      if(_play360modenaSound){
        _play360modenaSound = false;
        _play360modena();
      }
      return "images/360modena.png";
    }else if(_counter < 5000){
      if(_playEnzoSound){
        _playEnzoSound = false;
        _playEnzo();
      }
      return "images/enzo.png";
    }else if(_counter < 10000){
      if(_play812SuperfastSound) {
        _play812SuperfastSound = false;
        _play812Superfast();
      }
      return "images/812superfast.png";
    }else if(_counter < 50000){
      if(_playF40Sound){
        _playF40Sound = false;
        _playF40();
      }
      return "images/F40.png";
    }else if(_counter < 100000){
      if(_playLaFerrariSound){
        _playLaFerrariSound = false;
        _playLaFerrari();
      }
      return "images/laFerrari.png";
    }else if(_counter < 500000) {
      if(_play250GTOSound){
        _play250GTOSound = false;
        _play250GTO();
      }
      return "images/250GTO.png";
    }else if(_counter >= 50000){
      if(_playMonzaSound) {
        _playMonzaSound = false;
        _playMonza();
      }
      return "images/monza.png";
    }
  }

  Future<void> _playDino() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/dino.mp3');
    player.setClip(start: Duration(seconds: 15), end: Duration(seconds: 20));
    player.play();
  }
  Future<void> _play458Italia() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/458Italia.mp3');
    player.setClip(start: Duration(seconds: 0), end: Duration(seconds: 3));
    player.play();
  }
  Future<void> _playTestarossa() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/testarossa.mp3');
    player.setClip(start: Duration(seconds: 32), end: Duration(seconds: 35));
    player.play();
  }
  Future<void> _play360modena() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/360modena.mp3');
    player.setClip(start: Duration(seconds: 2), end: Duration(seconds: 5));
    player.play();
  }
  Future<void> _playEnzo() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/enzo.mp3');
    player.setClip(start: Duration(seconds: 146), end: Duration(seconds: 150));
    player.play();
  }
  Future<void> _play812Superfast() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/812superfast.mp3');
    player.setClip(start: Duration(seconds: 6), end: Duration(seconds: 10));
    player.play();
  }
  Future<void> _playF40() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/F40.mp3');
    player.setClip(start: Duration(seconds: 0), end: Duration(seconds: 10));
    player.play();
  }
  Future<void> _playLaFerrari() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/laFerrari.mp3');
    player.setClip(start: Duration(seconds: 35), end: Duration(seconds: 39));
    player.play();
  }
  Future<void> _play250GTO() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/250GTO.mp3');
    player.setClip(start: Duration(seconds: 13), end: Duration(seconds: 19));
    player.play();
  }
  Future<void> _playMonza() async {
    final player = AudioPlayer();
    var duration = await player.setAsset('sounds/monza.mp3');
    player.setClip(start: Duration(seconds: 8), end: Duration(seconds: 14));
    player.play();
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + (1*_bonusMultiplicatorNumbers);
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
      var cost = 100 * _bonusMultiplicatorNumbers;
      if(_counter >= cost){
        _counter = _counter - cost;
        _bonusMultiplicatorNumbers++;
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
                          '${_autoclickNumbers}/s : ${_autoclickNumbers*50} HP',
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
                          'X${_bonusMultiplicatorNumbers+1} : ${_bonusMultiplicatorNumbers*100} HP',
                          style: GoogleFonts.domine(
                            textStyle:TextStyle(color:Colors.white, fontSize:20,),
                          )
                      ),
                    ],
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
