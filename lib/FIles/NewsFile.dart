import 'package:bfit/FIles/FireBasePackage/FireBase.dart';
import 'package:bfit/Models/NewsModels.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsFile extends StatefulWidget{
 final Function callback;

  const NewsFile({Key key,this.callback}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsFileState();
  }
}
class _NewsFileState extends State<NewsFile>{
  bool mainstate=false;
  List<NewsModels> newsfeedlist;
  ScrollController _hideButtonController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsfeedlist=new List();
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
    _callfirebasenewslsit();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(height: double.infinity, decoration:  UiViewsWidget.BackgroundImage(),
      child:mainstate==true?_newslist():Center(child:  UiViewsWidget.progressdialogbox(),),
      ),

    );

  }


  _newslist() {

   return ListView.builder(
    shrinkWrap: true,
    controller: _hideButtonController,

    physics: NeverScrollableScrollPhysics(),
    itemCount: newsfeedlist.length ,
    scrollDirection: Axis.vertical,
    itemBuilder: (context,index)
    {
      return UiViewsWidget.NewsFeedHomeListITemView(newsfeedlist[index]);
    }) ;

  }

  void _callfirebasenewslsit() {

    FireBase.getnewslist().then((datas){
      newsfeedlist=datas;
      setState(() {
        mainstate=true;

      });
      //UiViewsWidget.showprogressdialogcomplete(context, false);
    });
    //UiViewsWidget.showprogressdialogcomplete(context, false);

  }
}