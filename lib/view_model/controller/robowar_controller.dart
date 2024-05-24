import 'package:flutter/material.dart';

class RoboWarController extends ChangeNotifier{
  bool containerOne=false;
  bool containerTwo=false;
  bool containerThree=false;



  openContainer1(){
    containerOne=!containerOne;
    containerTwo=false;
    containerThree=false;
    notifyListeners();
  }

  openContainer2(){
    containerTwo=!containerTwo;
    containerOne=false;
    containerThree=false;
    notifyListeners();
  }

  openContainer3(){
    containerThree=!containerThree;
    containerTwo=false;
    containerOne=false;
    notifyListeners();
  }


}