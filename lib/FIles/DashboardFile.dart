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
  int currentPage = 0;
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

    Screenview= HomeFile(this.callback);
    startlistnerformenuitem();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(backgroundColor: Colors.white,
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

  void _selectedtap(int i) {
    if(i==0)
    {
      setState(() {
        weddingselected=true;
      });
      setState(() {
        artistselected=false;
      });
      setState(() {
        homeselected=false;
      });
      setState(() {
        businessselected=false;
      });
      setState(() {
        settingselected=false;
      });
      /// SET SCREEN
      Screenview=WeddingEventFile();

    }
    else if(i==1)
    {
      setState(() {
        weddingselected=false;
      });
      setState(() {
        artistselected=true;
      });
      setState(() {
        homeselected=false;
      });
      setState(() {
        businessselected=false;
      });
      setState(() {
        settingselected=false;
      });
//// SET SCREEN
      Screenview=ArtistFile();
    }
    else if(i==2)
    {
      setState(() {
        weddingselected=false;
      });
      setState(() {
        artistselected=false;
      });
      setState(() {
        homeselected=true;
      });
      setState(() {
        businessselected=false;
      });
      setState(() {
        settingselected=false;
      });
      //// SET SCREEN
      Screenview=HomeFile(this.callback);
    }
    else if(i==3)
    {
      setState(() {
        weddingselected=false;
      });
      setState(() {
        artistselected=false;
      });

      setState(() {
        homeselected=false;
      });

      setState(() {
        businessselected=true;
      });

      setState(() {
        settingselected=false;
      });
      //// SET SCREEN
      Screenview=BusinessFile();
    }
    else if(i==4)
    {
      setState(() {
        weddingselected=false;
      });
      setState(() {
        artistselected=false;
      });
      setState(() {
        homeselected=false;
      });
      setState(() {
        businessselected=false;
      });
      setState(() {
        settingselected=true;
      });
      //// SET SCREEN
      Screenview=SettingFile();
    }



  }

  void startlistnerformenuitem() {
    UiViewsWidget.statestt.listen((state)
    {
      if(state==phoneass.Home){
        setState(() {
          Screenview=HomeFile(this.callback);
        });

      }
      if(state==phoneass.profile)
      {
        setState(() {
          Screenview=MyProfileFile();
        });

      }
      if(state==phoneass.message)
      {
        setState(() {
        Screenview=UserMessageFile();
        });
      }
      if(state==phoneass.news)
      {
        setState(() {
        Screenview=NewsFile(callback: this.callback,);
        });
      }
      if(state==phoneass.bookmarks)
      {
        setState(() {
        Screenview=MyBookmarksListFile();
        });
      }
      if(state==phoneass.gym)
      {
        setState(() {
        Screenview=GymListFile(callback: this.callback,);
        });
      }
      if(state==phoneass.exercise)
      {
        setState(() {
        Screenview=ExerciseHeaderFile(callback: this.callback,);
        });
      }
 if(state==phoneass.workout)
      {
        setState(() {
        Screenview=WorkoutsFile(callback: this.callback,);
        });
      }

    });

  }

}


