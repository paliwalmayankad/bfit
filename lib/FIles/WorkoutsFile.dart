import 'package:bfit/FIles/WorkoutToExerciseListFile.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutsFile extends StatefulWidget{
  final Function callback;

  const WorkoutsFile({Key key,this.callback}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WorkoutfileState();
  }
}
class WorkoutfileState extends State<WorkoutsFile>{
  bool mainstate=false;
  ScrollController _hideButtonController;
  bool isworkoutassign=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _hideButtonController = new ScrollController();

    _hideButtonController.addListener(() {
      print("listener");
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        this.widget.callback(false);
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        this.widget.callback(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(decoration: UiViewsWidget.BackgroundImage(),
        child: Container(height: double.infinity, child: _createbodydesign(),),),






    );
  }

  _createbodydesign() {
    bool showchild=false;
    return Container(margin: EdgeInsets.only(left: 15,right: 15),

      child: Stack(children: <Widget>[
        isworkoutassign==false?  Container( child: Card(elevation: 12,child: Container(padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),

        child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
           Text("No workouts to show ask your trainer to assign workout",textAlign:TextAlign.center,style: TextStyle(color: MyColors.basetextcolor,fontSize: 17,fontWeight: FontWeight.bold)),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              setState(() {
                isworkoutassign=true;
              });

            },

            child: Container(padding: EdgeInsets.only(top: 15,bottom: 15,left: 8,right: 8), decoration: UiViewsWidget.greenblackcolorbackground(),
          child: Text("Request workout",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ),),


        ],),)
        ),):Container(child:
    ListView.builder(shrinkWrap: true,
        physics: ClampingScrollPhysics(),
    controller: _hideButtonController,

    itemCount:3 ,
    scrollDirection: Axis.vertical,
    itemBuilder: (context,index)
    {
    return  Container(child: Column(children: <Widget>[
    ExpandablePanel( tapHeaderToExpand: true,
      hasIcon: false,
      header:Card(elevation: 5,child:
      Container(padding: EdgeInsets.only(top: 4,bottom: 4,left: 5,right: 5),

        child:
        Row(children: <Widget>[
          ClipRRect(

            borderRadius: BorderRadius.circular(25.0),
            child:
            Container(child: FadeInImage(
              height: 80,
              width: 80,

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
              Text("Ali Zafer",style: TextStyle(color: MyColors.basetextcolor,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Jagatpura, Jaipura",style: TextStyle(color: MyColors.basetextcolor,fontSize: 18,fontWeight: FontWeight.bold),),

            ],),],),

      )) ,
      expanded: Container(margin: EdgeInsets.only(left: 10,right: 10), child:
      ListView.builder(
          shrinkWrap: true,

          itemCount:3 ,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index)
          {
            return InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkToExerciseListFile()));

                },
                child:
                Container(child: Column(children: <Widget>[
              Card( elevation: 10,child:
              Container(padding: EdgeInsets.only(top: 4,bottom: 4,left: 5,right: 5),

                child:
                Row(children: <Widget>[
                  ClipRRect(

                    borderRadius: BorderRadius.circular(25.0),
                    child:
                    Container(child: FadeInImage(
                      height: 80,
                      width: 80,

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
                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                       Container(child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text("Ali Zaferw",style: TextStyle(color: MyColors.basetextcolor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("Jagatpura, Jaipura",style: TextStyle(color:Colors.black54,fontSize: 13,),),

                        ],)),

                         Align(alignment:Alignment.topRight,child:Image.asset(ConstantsForImages.bookmark,height: 35,width: 35,))

                      ],),
                        SizedBox(height: 5,),
                      Text("Jagatpura, Jaipura",style: TextStyle(color: Colors.black54,fontSize: 13,),),

                    ],),],),

              ),),


            ],),));


          })

        ,),

    ),




    ],),);


    })),],),

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
}