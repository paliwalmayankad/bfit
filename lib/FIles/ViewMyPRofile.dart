import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMyPRofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ViewmyprofileState();
  }
}
class _ViewmyprofileState extends State<ViewMyPRofile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      body: Container(child:Column(children: <Widget>[
        //// USER PROFILE
        Container(height: 100,
          child:
          Container(
            child:FadeInImage(
          height: 140,
          width: 150,
          fit: BoxFit.fill,
          image: NetworkImage(""),
              placeholder: AssetImage(ConstantsForImages.imgplaceholder),),),)


      ],) ),

    );
  }
}