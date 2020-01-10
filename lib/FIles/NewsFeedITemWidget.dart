import 'package:bfit/Models/NewsModels.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:flutter/material.dart';

class NewsFeedITemWidget extends StatefulWidget{
  final List<NewsModels> newsfeedlist;
  const NewsFeedITemWidget({Key key,this.newsfeedlist}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NEwsFeedItemWidgetcreatestate();
  }
}
class _NEwsFeedItemWidgetcreatestate extends State<NewsFeedITemWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.newsfeedlist.length ,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index)
        {
          return UiViewsWidget.NewsFeedHomeListITemView(widget.newsfeedlist[index]);
        }) ;
  }
}