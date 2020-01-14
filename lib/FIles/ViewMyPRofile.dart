import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
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
      appBar: getAppBar(),
      body: Container(height:double.infinity,width:double.infinity,decoration: UiViewsWidget.BackgroundImage(),
          child:Column(children: <Widget>[
        //// USER PROFILE
            Stack(overflow: Overflow.visible,
              children: <Widget>[
                FadeInImage(
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  image: NetworkImage(""), placeholder: AssetImage(ConstantsForImages.imgplaceholder),),

                Container(decoration: UiViewsWidget.lightgreycolorsquaretrans(),height:240,
                    width:  double.infinity,
                    child: Align( alignment:Alignment.bottomCenter,
                      child:Padding(padding: EdgeInsets.only(bottom: 5),
                        child:Container(padding: EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                            decoration: BoxDecoration( border: Border.all(
                                width: 1.0,color: Colors.white

                            ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0) //                 <--- border radius here
                              ),),
                            child:
                        Text("Change profile",
                          style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),),
                    ))
              ],
            ),

            ///// RAW FOR NAME ADDRESSS AND FOLLOWERS AND FOLLOWING
            Padding(padding: EdgeInsets.only(top: 15,left: 10,right: 10),
            child: Row(children: <Widget>[
              //// COLUMN FOR NAME ANDS ADDRESS
              /// COLUMN FOR FOLLOWERS
              /// COLUMN FOR FOLLOWING


            ],),
            )


      ],) ),

    );
  }

  getAppBar() {double statusbarHeight = MediaQuery
      .of(context)
      .padding
      .top;


  return PreferredSize(
      preferredSize: Size.fromHeight(40+statusbarHeight),

      // here the desired height
      child:AppBar( backgroundColor: MyColors.basegreencolor, // this will hide Drawer hamburger icon
          actions: <Widget>[Container()],
          automaticallyImplyLeading: false,flexibleSpace:
          Container(padding: new EdgeInsets.only(top: statusbarHeight),

            child: Image.asset(ConstantsForImages.bfitlogowithname),
          )));}
}