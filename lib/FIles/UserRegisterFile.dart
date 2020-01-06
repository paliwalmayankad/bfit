import 'dart:collection';

import 'package:bfit/FIles/FireBasePackage/FireBase.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/MyColors.dart';
import 'package:bfit/Utils/PrefrencesManager.dart';
import 'package:bfit/Utils/Stringconstants.dart';
import 'package:bfit/Utils/UiViewsWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class UserRegisterFile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Userregisterfilestate();
  }
}
class _Userregisterfilestate extends State<UserRegisterFile>
{
  bool namequestion=true,
      nameanswer=false,
      addressquestion=false,
      addressanswer=false,
      agequestion=false,
      ageanswer=false,
      heightquestion=false,
      heightanswer=false,
      weightquestion=false,
      weightanswer=false,
      genderquestion=false,
      genderanswer=false,
      emailquestion=false,
      emailanswer=false;
  TextEditingController messagecontroller;
  String nameanswerstring,addressanswerstring,ageanswerstring,heightanswerstring,weightanswerstring,
      genderanswerstring,emailanswerstring;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messagecontroller=new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(resizeToAvoidBottomPadding: true,
      body:SafeArea(child:
      Container(width: double.infinity,height: double.infinity,
          decoration:
          UiViewsWidget.BackgroundImage(),
          child:SingleChildScrollView(child:
          Container(margin: const EdgeInsets.only(top: 40,left: 10,bottom: 10,right: 10),

              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                //          //// CONTAINER FOR USER NAME ASK
                new Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your name ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )),
                //// NAME ANSWER
                nameanswer==true?Align(
                    alignment: Alignment.centerRight,child:
                Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(nameanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),

                /// ASK FOR QUESTION ADDRESS
                addressquestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Address ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR ADDRESS
                addressanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(addressanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),

                //// ASK FOR AGE
                agequestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Age ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR AGE
                ageanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(ageanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
//// ASK FOR HEIGHT
                heightquestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Height ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR HEIGHT
                heightanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(heightanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                ////ASK FOR WEIGHT
                weightquestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Weight(kg) ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR Weight
                weightanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(weightanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ASK FOR GENDER
                genderquestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Gender ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR GENDER
                genderanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(genderanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                /// ASK FOR EMAIL
                emailquestion==true? Align(
                    alignment: Alignment.centerLeft,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greyblackcolorbackground(),

                  child: Text('What is your Email ?',
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),
                //// ANSWER FOR EMAIL
                emailanswer==true? Align(
                    alignment: Alignment.centerRight,child: Container(  padding: EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
                  decoration: UiViewsWidget.greenblackcolorbackground(),

                  child: Text(emailanswerstring,
                    style: TextStyle(color: Colors.white),textAlign: TextAlign.left,) ,
                )):SizedBox(),



              ],)))

      ),


      ),
      bottomNavigationBar: _answereditsection(),
    );
  }

  _answereditsection() {
    return SingleChildScrollView(child:Padding( padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom),
        child:Container(height: 60,
            color: MyColors.basegreencolor,
            child:SingleChildScrollView(scrollDirection: Axis.vertical,

                child: Container(padding: EdgeInsets.only(bottom: 0,left: 5,right: 5), height: 40,margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10), decoration: UiViewsWidget.whiteboxroundeddecoration(),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    /// TEXTFIELD
                    Expanded(flex: 4, child:TextFormField(controller: messagecontroller,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.left,
                      decoration: UiViewsWidget.editextdecorationforchat("Send message"),cursorColor: MyColors.basetextcolor,


                    ),),
                    Expanded(flex: 1,
                        child:InkWell(onTap: (){

                          _checkfortextandupdatevalue();

                        }, child:
                        Image.asset(ConstantsForImages.messagesendicon,height: 25,width: 25,),)
                    )

                  ],),
                )))));


  }

  void _checkfortextandupdatevalue() {
    //Toast.show('text should not be empty', context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
    String message=messagecontroller.text.toString();
    if(message==null||message==""||message.isEmpty||message==" "){
      Toast.show('message cant be empty', context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);

    }else {
      if (nameanswer == false) {
        setState(() {
          nameanswerstring = message;
          nameanswer = true;
          addressquestion = true;
          messagecontroller.text = null;
        });
      }
      else if (addressanswer == false) {
        setState(() {
          addressanswerstring = message;
          addressanswer = true;
          agequestion = true;
          messagecontroller.text = null;
        });
      }

      else if (ageanswer == false) {
        setState(() {
          ageanswerstring = message;
          ageanswer = true;
          heightquestion = true;
          messagecontroller.text = null;
        });
      }

      else if (heightanswer == false) {
        setState(() {
          heightanswerstring = message;
          heightanswer = true;
          weightquestion = true;
          messagecontroller.text = null;
        });
      }

      else if (weightanswer == false) {
        setState(() {
          weightanswerstring = message;
          weightanswer = true;
          genderquestion = true;
          messagecontroller.text = null;
        });
      }

      else if (genderanswer == false) {
        setState(() {
          genderanswerstring = message;
          genderanswer = true;
          emailquestion = true;
          messagecontroller.text = null;
        });
      }
      else if (emailanswer == false) {
        setState(() {
          emailanswerstring = message;
          emailanswer = true;
          messagecontroller.text = "";
        });
        _registerusertodatabaseandredirecttohome();

      }
      else {
        messagecontroller.text = null;
        // Toast.show("FORM SUBMITTED", context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);


      }
    }
  }

  void _registerusertodatabaseandredirecttohome()
  {

    Map<String,dynamic> map=
    {
      "address":addressanswerstring,
      "age":ageanswerstring,
      "email":emailanswerstring,
      "gender":genderanswerstring,
      "height":heightanswerstring,
      "mobile":PrefrencesManager.getString(Stringconstants.MOBILE),
      "name":nameanswerstring,
      "role":"user",
      "weight":weightanswerstring,

    };
    PrefrencesManager.setBool(Stringconstants.LOGIN, true);
    PrefrencesManager.setString(Stringconstants.ADDRESS, addressanswerstring);
    PrefrencesManager.setString(Stringconstants.AGE, ageanswerstring);
    PrefrencesManager.setString(Stringconstants.EMAIL, emailanswerstring);
    PrefrencesManager.setString(Stringconstants.GENDER, genderanswerstring);
    PrefrencesManager.setString(Stringconstants.HEIGHT, heightanswerstring);
    PrefrencesManager.setString(Stringconstants.WEIGHT, weightanswerstring);
    PrefrencesManager.setString(Stringconstants.NAME, nameanswerstring);
    PrefrencesManager.setString(Stringconstants.ROLE, "user");
    Firestore.instance.collection("users").add(map).then((data){
PrefrencesManager.setString(Stringconstants.USERID, data.documentID.toString());

      Navigator.pushReplacementNamed(context, '/dashboard');

    });
    /*FireBase.registeruser(map).then((data){
      if(data==true) {

      }
      else{
        print("error");
      }
    });*/



  }
}