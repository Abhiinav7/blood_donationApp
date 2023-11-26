import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseServices{

  final CollectionReference donor =
  FirebaseFirestore.instance.collection("donor");

  void addDOnor(String name,String phone,String group) {
    try{
      final data = {
        "name": name,
        "phone": phone,
        "group": group
      };
      donor.add(data);
    }
    catch(e){
      print(e);
    }
  }

  void updateDonor(docId,String name,String phone,String group,BuildContext context){
    try{
      final data={
        "name":name,
        "phone":phone,
        "group":group,
      };
      donor.doc(docId).update(data).then((value) => Navigator.pop(context));
    }
    catch(e){
      print("error////////////////////////////${e}");
    }
  }
  void deleteDonor(docId) {
    donor.doc(docId).delete();
  }

}