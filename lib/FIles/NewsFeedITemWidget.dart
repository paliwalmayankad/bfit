import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:flutter/material.dart';

class NewsFeedITemWidget extends StatefulWidget{
  final List<String> newsfeedlist;
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
        itemCount: 10 ,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index)
        {
          return UiViewsWidget.NewsFeedHomeListITemView();
        }) ;
  }
}