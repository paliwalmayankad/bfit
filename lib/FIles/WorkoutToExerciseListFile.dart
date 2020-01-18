import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:flutter/material.dart';

import 'ExerciseDetailFile.dart';

class WorkToExerciseListFile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WorkToExerciseListFileState();
  }
}
class WorkToExerciseListFileState extends State<WorkToExerciseListFile>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: getAppBar(),
    body: Container(width: double.infinity, color: Colors.white,
    child: _createbody(),
    ),
    );
  }

  getAppBar() {

    double statusbarHeight = MediaQuery
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
            )));
  }

  _createbody() {
    return Container( margin: EdgeInsets.only(top: 8,bottom: 8,left: 12,right: 12),
      child: Column(children: <Widget>[
        Text("1 Week workout for beginers",textAlign:TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold ),),
        SizedBox(height: 5,),
      Container(margin: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5), child:
      ListView.builder(shrinkWrap: true,

          itemCount:5 ,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index)
          {
            return
              InkWell(
                  onTap: (){
//// FORWARD TO EXERCISE DETAIL SCREEN
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseDetailFile()));
                  },


                  child:Card(elevation:5,child:

                  Container(padding: EdgeInsets.only(top: 8,bottom:8,left: 5,right: 5),

                      child:
                      Row(children: <Widget>[
                        ClipRRect(

                          borderRadius: BorderRadius.circular(25.0),
                          child:
                          Container(child: FadeInImage(
                            height: 70,
                            width: 70,

                            fit: BoxFit.fill,
                            image: NetworkImage(
                                ""),
                            placeholder: AssetImage(
                                ConstantsForImages.imgplaceholder),),),
                        ),

                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Exercise Name",style: TextStyle(color: MyColors.basetextcolor,fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("Body PArt",style: TextStyle(color: Colors.black54,fontSize: 14,),),
                            SizedBox(height: 5,),
                            Text("Body PArt",style: TextStyle(color: Colors.black54,fontSize: 14,),),


                          ],),],)),

                  ));
          })

      )],),


    );


  }

}