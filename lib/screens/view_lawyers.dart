import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/widgets/constants.dart';

class ViewLaw extends StatefulWidget {
  @override
  _ViewLawState createState() => _ViewLawState();
}

class _ViewLawState extends State<ViewLaw> {
  final DocumentReference documentReference =
      FirebaseFirestore.instance.doc("law/mylawyer");
  String name = null;
  String role = null;
  String time = null;
  StreamSubscription<DocumentSnapshot> subscription;

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          name = datasnapshot.data()['name'];
          role = datasnapshot.data()['role'];
          time = datasnapshot.data()['time'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
           name = datasnapshot.data()['name'];
          role = datasnapshot.data()['role'];
          time = datasnapshot.data()['time'];
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('View Lawyers'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _fetch();
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: name == null
                      ? Container()
                      : Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            elevation: 0.5,
                            child: Text("Name:"+""+
                              name,
                              style: GoogleFonts.mcLaren(
                                fontSize: 20.0,
                                color: kYellowColor,
                              ),
                            ),
                          ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: role == null
                      ? Container()
                      : Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            elevation: 0.5,
                            child: Text("Role:"+""+
                              role,
                              style: GoogleFonts.mcLaren(
                                fontSize: 15.0,
                                color: kBlueColor,
                              ),
                            ),
                          ),
                      ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: time == null
                      ? Container()
                      : Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            elevation: 0.5,
                            child: Text("Available:"+""+
                              time,
                              style: GoogleFonts.mcLaren(
                                fontSize: 15.0,
                                color: kBlueColor,
                              ),
                            ),
                          ),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
