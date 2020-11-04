import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sheria_legal/screens/admin_page.dart';

class UserManagement {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  UserManagement({this.auth, this.firestore});
    authorizeAccess(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) { 
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get()
          .then((docums) {
        if (docums.docs[0].exists) {
          if (docums.docs[0].data()['role'] == 'admin') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AdminPage()));
          } else {
            alert(context);
          }
        }
      });
    });
  }
  void alert(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text('Not Authorized'),
        content: Text('You\'re not an admin!'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Alright',
              style: TextStyle(color: Colors.green, fontSize: 15.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
  Future<void> addUserInfo(userData) async {
    firestore.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

   getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }


   searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }
  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async {
    return firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await firestore
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
