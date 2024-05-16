import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'database.dart';

class DatabaseMethods
{
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<String> uploadImageToStorage(String childName, Uint8List file) async {
  //   Reference ref = storage.ref().child(childName).child('id');
  //   UploadTask uploadTask = ref.putData(file);
  //   TaskSnapshot snapshot = await uploadTask;
  //   String downnloadUrl = await snapshot.ref.getDownloadURL();
  //
  //   return downnloadUrl;
  // }

 //  Future<String> saveData({required String name, required String age, required Uint8List file})
 //  async{
 //    String imageUrl = await uploadImageToStorage('profile/$name', file);
 // await _firestore.collection('userProfile').add({
 //   'name': name,
 //   'age': age,
 //   'imageUrl': imageUrl,
 // });
 //  return imageUrl;
 //
 //  }



  Future addEmplyeeDeatils( Map<String, dynamic> employeeInfoMap, String id , ) async {
    return FirebaseFirestore.instance
        .collection("employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmpolyeeDeatils() async {
    return FirebaseFirestore.instance.collection("employee").snapshots();
  }

}
