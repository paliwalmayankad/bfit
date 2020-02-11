import 'package:bfit/FIles/MyBookmarksListFile.dart';
import 'package:bfit/FIles/MyProfileFile.dart';
import 'package:bfit/FIles/NewsFile.dart';
import 'package:bfit/FIles/UserMessageFile.dart';
import 'package:bfit/FIles/WorkoutsFile.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:bfit/FIles/BusinessFile.dart';
import 'package:bfit/FIles/HomeFile.dart';
import 'package:bfit/FIles/WeddingEventFile.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/PrefrencesManager.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ArtistFile.dart';
import 'ExerciseHeaderFile.dart';
import 'GymListFile.dart';
import 'SettingFile.dart';


class DashboardFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardFileState();
  }
}

class DashboardFileState extends State<DashboardFile>
{
  int currentPage = 2;
  GlobalKey bottomNavigationKey = GlobalKey();
  bool homeselected=true;
  bool weddingselected=false;
  bool artistselected=false;
  bool businessselected=false;
  bool settingselected=false;
 static Widget Screenview;

  bool floatingbuttonstatevisible=true;
  GlobalKey<ScaffoldState> scaffoldState= GlobalKey<ScaffoldState>();
  void callback(bool nextPage) {
    setState(() {
      this.floatingbuttonstatevisible = nextPage;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool ss=PrefrencesManager.getBool("LOGIN");
    print("loginstatus "+ss.toString());
currentPage=0;
    Screenview= HomeFile(this.callback);
    startlistnerformenuitem();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(

        onWillPop: _checkforapp,
        child: Scaffold(backgroundColor: Colors.white,
      body: Container(decoration: UiViewsWidget.BackgroundImage(), child: Screenview),
      key: scaffoldState,
      appBar: getAppBar(),
      floatingActionButton: floatingbuttonstatevisible==true?InkWell(
          onTap: (){
            scaffoldState.currentState.openEndDrawer();

          },
          child:
          Container(height: 70,width: 70,
            child: Image.asset(ConstantsForImages.bfitsplashlogo),)):SizedBox(),
      endDrawer: UiViewsWidget.draweritemandcontainer(context,scaffoldState,Screenview),


    ));
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






  void startlistnerformenuitem() {
    UiViewsWidget.statestt.listen((state)
    {
      if(state==phoneass.Home){
        setState(() {
          currentPage=0;
          Screenview=HomeFile(this.callback);
        });

      }
      if(state==phoneass.profile)
      {
        setState(() {
          currentPage=1;
          Screenview=MyProfileFile();
        });

      }
      if(state==phoneass.message)
      {
        setState(() {
          currentPage=1;
        Screenview=UserMessageFile();
        });
      }
      if(state==phoneass.news)
      {
        setState(() {
          currentPage=1;
        Screenview=NewsFile(callback: this.callback,);
        });
      }
      if(state==phoneass.bookmarks)
      {
        setState(() {
          currentPage=1;
        Screenview=MyBookmarksListFile();
        });
      }
      if(state==phoneass.gym)
      {
        setState(() {
          currentPage=1;
        Screenview=GymListFile(callback: this.callback,);
        });
      }
      if(state==phoneass.exercise)
      {
        setState(() {
          currentPage=1;
        Screenview=ExerciseHeaderFile(callback: this.callback,);
        });
      }
 if(state==phoneass.workout)
      {
        setState(() {
          currentPage=1;
        Screenview=WorkoutsFile(callback: this.callback,);
        });
      }
 if(state==phoneass.setting)
      {
        setState(() {
          currentPage=1;
        Screenview=SettingFile();
        });
      }


    });

  }

  Future<bool> _checkforapp() async {
    bool out;
    if(currentPage==0){
      return true;
    }
    else{
      setState(() {
        currentPage=0;
        Screenview=HomeFile(this.callback);
      });
    }

  }

}


