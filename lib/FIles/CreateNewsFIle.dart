import 'dart:io';

import 'package:bfit/ImageHandler/ImagePickerHandler.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateNewsFile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateNEwsFileState();
  }
}
class _CreateNEwsFileState extends State<CreateNewsFile> with TickerProviderStateMixin,ImagePickerListener {
  TextEditingController titlecontroller,subtitlecontroller,descriptioncontroller;
  File _image;
  ImagePickerHandler imagePicker;
  AnimationController _controller;
  String photoselect="Add photo";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titlecontroller=new TextEditingController();
    subtitlecontroller=new TextEditingController();
    descriptioncontroller=new TextEditingController();
    _controller = new AnimationController(
      vsync: this,

      duration: const Duration(milliseconds: 500),
    );


    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();
  }
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(),
      body:
      Container(decoration: UiViewsWidget.BackgroundImage(),
        child: Container( child:_createabodyfornews(),

        ),



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

  Widget _createabodyfornews() {
    return Container(
      padding: EdgeInsets.only(left: 15,top: 20,right: 20,bottom: 15),
      decoration: UiViewsWidget.whiteboxroundeddecoration(),


      child:  Column(children: <Widget>[
        //// TITLE
        Container(decoration: BoxDecoration(color: Colors.black54,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),

                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)
            )
        ),
          padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
          child: TextFormField(
            controller: titlecontroller,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(60),
            ],
            cursorColor: Colors.white,

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title",
              hintStyle: TextStyle(color: Colors.white),
            ),),

        ),
        SizedBox(height: 10,),
        //// SUBTITLE
        Container(decoration: BoxDecoration(color: Colors.black54,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),

                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)
            )
        ),
          padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
          child: TextFormField(
            controller: subtitlecontroller,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(60),
            ],
            cursorColor: Colors.white,

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Subtitle",
              hintStyle: TextStyle(color: Colors.white),
            ),),

        ),
        SizedBox(height: 10,),
        //// DESCRIPTION

        Container(
          height: 150,
          decoration: BoxDecoration(color: Colors.black54,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),

                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)
              )
          ),
          padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
          child: TextFormField(
            controller: descriptioncontroller,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.multiline,

            maxLines: null,
            inputFormatters: [
              LengthLimitingTextInputFormatter(450),
            ],
            cursorColor: Colors.white,

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.white),
            ),),

        ),
        SizedBox(height: 30,),
        /// ADD PHOTO BUTTON
        InkWell(
            onTap: (){
              imagePicker.showDialog(context);

            },child:Container(decoration: UiViewsWidget.greenboxbutton(),padding: EdgeInsets.only(top: 20,
            bottom: 20,
            left: 55,
            right: 55),
          child: Text(photoselect,style: TextStyle(color: MyColors.basetextcolor),),
        )),
        SizedBox(height: 30,),
        /// ADD PHOTO BUTTON
        InkWell(
            onTap: (){
              _updatenews();

            },
            child:  Container(decoration: UiViewsWidget.greyblackcolorbackground(),padding: EdgeInsets.only(top: 20,
                bottom: 20,
                left: 55,
                right: 55),
              child: Text('Update',style: TextStyle(color: Colors.white),),
            ))



      ],),


    );

  }

  void _updatenews() {
    String title=titlecontroller.text.toString();
    String subtitle=subtitlecontroller.text.toString();
    String description=descriptioncontroller.text.toString();

    if(title==null||title.isEmpty||title==""||title==" "){
      UiViewsWidget.bottomsnackbar(
          context, "Please enter title", _scaffoldKey);
    }
    else if(subtitle==null||subtitle.isEmpty||subtitle==""||subtitle==" "){
      UiViewsWidget.bottomsnackbar(
          context, "Please enter subtitle", _scaffoldKey);
    }
    else if(description==null||description.isEmpty||description==""||description==" ") {
      UiViewsWidget.bottomsnackbar(
          context, "Please enter description", _scaffoldKey);
    }
    else if(_image==null){
      UiViewsWidget.bottomsnackbar(
          context, "Please select image", _scaffoldKey);
    }
    else{
      _uploaddatafirestore();
    }

  }

  @override
  userImage(File _image) {
    // TODO: implement userImage
    setState(() {
      photoselect="Photo addedd";
      if(_image!=null) {
        this._image = _image;
        UiViewsWidget.bottomsnackbar(
            context, "Photo uploaded successfully", _scaffoldKey);
      } //_scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('Photo uploaded successfully'),));
    });
  }

  void _uploaddatafirestore() {
    try{


    }
    catch(e){

    }


  }
}