import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Contact {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  MemoryImage? displayImage;


  Contact({this.id, this.firstName, this.lastName, this.fullName, this.displayImage});


  String getFullName() {
   return fullName = firstName! + ' ' + lastName!;
  }


}

class UserModel extends Contact {
  DocumentSnapshot? snapshot;

  String? email;
  String? bio;
  String? city;
  String? country;
  bool? isHost;
  bool? isCurrentlyHosting;
  String? password;

  UserModel({String id = '', String firstName = '', String lastName = '', String fullName = '', MemoryImage? displayImage, this.email = '', this.bio = '', this.city = '', this.country = '', this.isHost = false, this.isCurrentlyHosting = false, this.password = ''})
   : super(id: id, firstName: firstName, lastName: lastName, fullName: fullName, displayImage: displayImage){
    isHost = false;
    isCurrentlyHosting = false;
   }

   addUserToFirestore() async {
    Map<String, dynamic> data = {
      "bio" : bio,
      "city" : city,
      "country": country,
      "email": email,
      "firstName": firstName,
      "isHost": false,
      "lastName": lastName,
      "myPostingIDs": [],
      "savedPostingIDs": [],
      "earnings": 0
    };
    await FirebaseFirestore.instance.doc('users/$id').set(data);
  }

  addImageToFirestore(File imageFile) async {
    Reference reference = FirebaseStorage.instance.ref().child('userImages/$id/profile_pic.jpg');
    await reference.putFile(imageFile).whenComplete(() {});
    displayImage = MemoryImage(imageFile.readAsBytesSync());
  
  }
  getPersonalInfoFromFirestore() async {
    await getUserInfoFromFirestore();
    await getImageFromStorage();
  }

  getUserInfoFromFirestore() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(id).get();
    this.snapshot = snapshot;
    firstName = snapshot['firstName'] ?? "";
    lastName = snapshot['lastName'] ?? "";
    email = snapshot['email'] ?? "";
    bio = snapshot['bio'] ?? "";
    city = snapshot['city'] ?? "";
    country = snapshot['country'] ?? "";
    isHost = snapshot['isHost'] ?? false;
  }

  Future<MemoryImage> getImageFromStorage() async {
    if(displayImage != null){return displayImage!;}
    final String imagePath = "userImages/$id/profile_pic.jpg";
    final imageData = await FirebaseStorage.instance.ref().child(imagePath).getData();
    displayImage = MemoryImage(imageData!);

    return displayImage!;
  }
}