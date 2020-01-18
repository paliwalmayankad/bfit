import 'package:bfit/FIles/BodyParametersFIle.dart';
import 'package:bfit/FIles/CreateNewsFIle.dart';
import 'package:bfit/FIles/DashboardFile.dart';
import 'package:bfit/FIles/ExerciseHeaderFile.dart';
import 'package:bfit/FIles/GymDetailFile.dart';
import 'package:bfit/FIles/HealthIndicatorFile.dart';
import 'package:bfit/FIles/UserRegisterFile.dart';
import 'package:bfit/FIles/ViewMyPRofile.dart';
import 'package:flutter/material.dart';

class CommonUtils{
 static dynamic returnroutes(BuildContext context){
    return
      {

      '/dashboard': (context) => DashboardFile(),
      '/userregisterfile': (context) => UserRegisterFile(),
      '/bodyparametersfile': (context) => BodyparametersFile(),
      '/healthindicator': (context) => HealthIndicatorFile(),
      '/viewmyprofile': (context) => ViewMyPRofile(),
      '/createnewsfile': (context) => CreateNewsFile(),
      '/gymdetailfile': (context) => GymDetailFile(),
      '/exerciseheaderfile': (context) => ExerciseHeaderFile(),


    };

  }

}