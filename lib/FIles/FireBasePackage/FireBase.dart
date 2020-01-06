import 'package:bfit/Utils/PrefrencesManager.dart';
import 'package:bfit/Utils/Stringconstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}
