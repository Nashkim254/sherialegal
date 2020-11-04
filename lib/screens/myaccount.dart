import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sheria_legal/services/auth.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  // final DocumentReference documentRefer=
  //     FirebaseFirestore.instance.doc("users");
  //     String username = null;
  //     String useremail = null;
  //     StreamSubscription<DocumentSnapshot> usersubscription;
  //      void _fetchUser() {
  //   documentRefer.get().then((documentsnapshot) {
  //     if (documentsnapshot.exists) {
  //       setState(() {
  //         username = documentsnapshot.data()['UserName'];
  //         useremail = documentsnapshot.data()['UserEmail'];
  //       });
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //     usersubscription = documentRefer.snapshots().listen((documentsnapshot) {
  //     if (documentsnapshot.exists) {
  //       setState(() {
  //          username = documentsnapshot.data()['UserName'];
  //         useremail = documentsnapshot.data()['UserEmail'];
  //       });
  //     }
  //   });
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  //   usersubscription?.cancel();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment:Alignment(0.0, -0.3),
                color: Colors.green,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('code',style: TextStyle(fontSize:24.0),),
                    SizedBox(height: 10.0),
                    Text('code@gmail.com',style: TextStyle(fontSize:24.0),)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    RaisedButton(
                      onPressed: () {
                        AuthService().signOut();
                      },
                      child: Text('Logout'.toUpperCase()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
