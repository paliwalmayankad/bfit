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
        PrefrencesManager.setString(Stringconstants.HEIGHT, querySnapshot.documents[0].data['height']);
        PrefrencesManager.setString(Stringconstants.WEIGHT, querySnapshot.documents[0].data['weight']);
        PrefrencesManager.setString(Stringconstants.NAME, querySnapshot.documents[0].data['name']);
        PrefrencesManager.setString(Stringconstants.ROLE, querySnapshot.documents[0].data['role']);


        return true;
      }
      else {
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


      newslsit.add(newsmodels);

    }


return newslsit;

  }



}
