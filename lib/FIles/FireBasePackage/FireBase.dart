import 'package:bfit/Models/Bookmarkmodels.dart';
import 'package:bfit/Models/HomeGridItemModel.dart';
import 'package:bfit/Models/NewsModels.dart';
import 'package:bfit/Utils/ConstantsForImages.dart';
import 'package:bfit/Utils/PrefrencesManager.dart';
import 'package:bfit/Utils/Stringconstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireBase {
  static FirebaseAuth _auth;

  static var databaseReference;
  static SharedPreferences sharedPreferences;
  static String countrycode = "+91";

  static void FireBaseinit() {
    _auth = FirebaseAuth.instance;
    databaseReference = Firestore.instance;
  }

  static Future<bool> userisregisterornot(String mobileno) async {
    try {
      var querySnapshot = await Firestore.instance.collection('users').where(
          'mobile', isEqualTo: countrycode + mobileno).getDocuments();
      if (querySnapshot.documents.length > 0) {
        PrefrencesManager.setBool(Stringconstants.LOGIN, true);

        PrefrencesManager.setString(Stringconstants.ADDRESS, querySnapshot.documents[0].data['address']);
        PrefrencesManager.setString(Stringconstants.AGE, querySnapshot.documents[0].data['age']);
        PrefrencesManager.setString(Stringconstants.EMAIL, querySnapshot.documents[0].data['email']);
        PrefrencesManager.setString(Stringconstants.GENDER, querySnapshot.documents[0].data['gender']);
        PrefrencesManager.setString(Stringconstants.USERID, querySnapshot.documents[0].documentID);
        //PrefrencesManager.setString(Stringconstants.HEIGHT, querySnapshot.documents[0].data['height']);
        //PrefrencesManager.setString(Stringconstants.WEIGHT, querySnapshot.documents[0].data['weight']);
        PrefrencesManager.setString(Stringconstants.NAME, querySnapshot.documents[0].data['name']);
        PrefrencesManager.setString(Stringconstants.ROLE, querySnapshot.documents[0].data['role']);
        PrefrencesManager.setString(Stringconstants.USERPHOTO, querySnapshot.documents[0].data['img']);


        return true;

      }
      else
        {

        return false;

      }
    }
    catch (e) {
      print(e);
    }
  }

  static Future<bool> registeruser(Map<String, dynamic> map){
    bool flag=false;
    Firestore.instance.collection("users").add(map).then((data){


      flag=true;

    });

  }

  static Future<List<HomeGridItemModel>> getserviceslist() async{
    List<HomeGridItemModel> gridmodel= List();
  QuerySnapshot querySnapshot = await Firestore.instance.collection("services").getDocuments();
  var list = querySnapshot.documents;
for(int i=0;i<list.length;i++){
  HomeGridItemModel hmodel =new HomeGridItemModel();
  hmodel.documentid=list[i].documentID;
  hmodel.texttitle=list[i].data["title"];
  hmodel.img=list[i].data["img"];
  hmodel.timeduration=list[i].data["validtimeforbuy"];
  hmodel.priceforbuy=list[i].data["price"];
  hmodel.facilities=list[i].data["facilities"];
  gridmodel.add(hmodel);

}
return gridmodel;

  }
  static Future<List<NewsModels>> getnewslist() async{
    List<NewsModels> newslsit= List();
  QuerySnapshot querySnapshot = await Firestore.instance.collection("news").getDocuments();
  var list = querySnapshot.documents;
    for(int i=0;i<list.length;i++){
      NewsModels newsmodels =new NewsModels();
      newsmodels.newsid=list[i].documentID;
      newsmodels.newslikers=list[i].data["likes"];
      newsmodels.newsdislikers=list[i].data["dislikes"];
      newsmodels.newsimage=list[i].data["image"];
      newsmodels.newstitle=list[i].data["title"];
      newsmodels.newssubtitle=list[i].data["subtitle"];
      newsmodels.newsposttime=list[i].data["time"];
      newsmodels.uploaderimage=list[i].data["uploaderimage"];
      newsmodels.uploadername=list[i].data["uploadername"];
      newsmodels.bookmarkuserlist=list[i].data["bookmarks"];
      newsmodels.description=list[i].data["description"];

     /* List<dynamic> bookmarklist=new List();
      bookmarklist=list[i].data["bookmarks"];

      List<dynamic> likeslist=new List();
      likeslist=list[i].data["likes"];

      List<dynamic> dislikelist=new List();
      dislikelist=list[i].data["dislikes"];*/

      String userid=PrefrencesManager.getString(Stringconstants.USERID);
      //// CHECK BOOKMARK OR NOT
      try {
        for (int i = 0; i < newsmodels.bookmarkuserlist.length; i++) {
          if (userid == newsmodels.bookmarkuserlist[i]) {
            newsmodels.bookmark = true;
            break;
          }
        }
        //// CHECK FOR PAGE LIKE
        for (int i = 0; i < newsmodels.newslikers.length; i++) {
          if (userid == newsmodels.newslikers[i]) {
            newsmodels.like = true;
            break;
          }
        }
        //// CHECK FOR PAGE DISLIKE

        for (int i = 0; i < newsmodels.newsdislikers.length; i++) {
          if (userid == newsmodels.newsdislikers[i]) {
            newsmodels.dislike = true;
            break;
          }
        }
      }
      catch(e)
    {
      print(e);
    }

      newslsit.add(newsmodels);

    }


return newslsit;

  }


  static Future<List<Bookmarkmodels>> getbookmarklist() async{
    List<Bookmarkmodels> bookmarklist= List();
  var querySnapshot = await Firestore.instance.collection("users").document(PrefrencesManager.getString(Stringconstants.USERID)).get();
  var list = querySnapshot.data['bookmarkslist'];
    for(int i=0;i<list.length;i++){
      try {
        Bookmarkmodels bookmarkmo = new Bookmarkmodels();
        Map<dynamic,dynamic> map=list[i];
        bookmarkmo.id = map["id"];

        bookmarkmo.title = map["title"];
        bookmarkmo.date = map["date"];
        bookmarkmo.img = map["img"];
        bookmarkmo.category = map["cat"];


        bookmarklist.add(bookmarkmo);
      }
      catch(e)
    {
      print(e);
    }

    }


return bookmarklist;

  }



}
