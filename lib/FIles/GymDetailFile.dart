import 'package:bfit/Models/GymListModels.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/Stringconstants.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GymDetailFile extends StatefulWidget{
 final GymListModels gymdetail;
  const GymDetailFile({Key key,this.gymdetail}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GymdetailFileState();
  }
}
class GymdetailFileState extends State<GymDetailFile>{
  List<dynamic> bannerimagesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      bannerimagesList = new List();

      bannerimagesList = widget.gymdetail.gympictures;
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar(),
      body: Container(height: double.infinity, decoration: UiViewsWidget.BackgroundImage(),
      child: Stack(children: <Widget>[

        _createcolumnandcompletedetailforgym(),

      ],),
      ),

    );
  }

  _createcolumnandcompletedetailforgym() {
    return Container(
    child: SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Column(children: <Widget>[
      Container(height:200,child: buildswiper(),),




    ],),

    ));
  }

  buildswiper() {
    try {
      return bannerimagesList.length > 0 ? Swiper(
        outer: false,
        itemBuilder: (context, i) {
          return   FadeInImage(
            height: 80,
            width: 80,

            fit: BoxFit.fill,
            image: NetworkImage(bannerimagesList[i].toString(),), placeholder: AssetImage(ConstantsForImages.imgplaceholder,),);
        },

        autoplay: true,
        physics: NeverScrollableScrollPhysics(),
        duration: 300,scrollDirection: Axis.horizontal,

        pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0),),
        itemCount: bannerimagesList.length,
      ) : Image.asset(ConstantsForImages.imgplaceholder, fit: BoxFit.cover,);
    }catch(e){
      print(e);
    }
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