import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sheria_legal/components/category_card.dart';
import 'package:sheria_legal/components/lawyer_card.dart';
import 'package:sheria_legal/components/search_bar.dart';
import 'package:sheria_legal/law_components/civil_law.dart';
import 'package:sheria_legal/law_components/commercial_law.dart';
import 'package:sheria_legal/law_components/criminal_law.dart';
import 'package:sheria_legal/law_components/family_law.dart';
import 'package:sheria_legal/screens/admin_page.dart';
import 'package:sheria_legal/screens/appointments.dart';
import 'package:sheria_legal/screens/faqs.dart';
import 'package:sheria_legal/screens/feedback.dart';
import 'package:sheria_legal/screens/myaccount.dart';
import 'package:sheria_legal/services/auth.dart';
import 'package:sheria_legal/services/user_management.dart';
import 'package:sheria_legal/widgets/constants.dart';

class Home extends StatefulWidget {
 final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  Home({this.auth, this.firestore});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DocumentReference documentReference =
      FirebaseFirestore.instance.doc("law/mylawyer");
  String name = null;
  String role = null;
  StreamSubscription<DocumentSnapshot> subscription;
  void _fetchDoc() {
    documentReference.get().then((documentsnapshot) {
      if (documentsnapshot.exists) {
        setState(() {
          name = documentsnapshot.data()['name'];
          role = documentsnapshot.data()['role'];
        });
      }
    }).catchError((e) {
      print(e);
    });
  }
 
  @override
  void initState() {
    super.initState();
    subscription = documentReference.snapshots().listen((documentsnapshot) {
      if (documentsnapshot.exists) {
        setState(() {
          name = documentsnapshot.data()['name'];
          role = documentsnapshot.data()['role'];
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
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.amber,
                child: const Text('C'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const Text('O'),
                )
              ],
              accountEmail:  Text('code@gmail'),
              accountName:  Text('code'),
            ),
            ListTile(
              title: const Text(
                'SheriaLegal',
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              trailing: Icon(Icons.arrow_upward),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              title: const Text('Feedback',
                  style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo)),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FeedBack()));
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Admin Area',
                  style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
              trailing: Icon(Icons.account_circle),
              onTap: () {
               UserManagement().authorizeAccess(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('FAQs',
                  style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              trailing: new Icon(Icons.assignment),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Faqs()));
              },
            ),
            Divider(),
            ListTile(
              title: const Text(
                'Logout',
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              trailing: new Icon(Icons.person_pin),
              onTap: () {
                AuthService().signOut();
              },
            ),
            Divider(),
            ListTile(
              title: const Text(
                'Book Appointment',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lime),
              ),
              trailing: Icon(Icons.border_color),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Appointments()));
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Close',
                  style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('SheriaLegal'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyAccount()));
            },
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Find Your Desired\nLawyer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: kTitleTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SearchBar(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildCategoryList(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Top Lawyers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildLawyerList(),
          ],
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Criminal()));
            },
            child: CategoryCard(
              'Criminal\nLaw',
              'assets/images/law.png',
              kBlueColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Family()));
            },
            child: CategoryCard(
              'Family\nLaw',
              'assets/images/gravel.png',
              kYellowColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Commercial()));
            },
            child: CategoryCard(
              'Commercial\nLaw',
              'assets/images/justice.png',
              kYellowColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Civil()));
            },
            child: CategoryCard(
              'Civil\nLaw',
              'assets/images/charge.png',
              kYellowColor,
            ),
          ),
        ],
      ),
    );
  }

  buildLawyerList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          LawyerCard(
            name == null ? "" : name,
            role == null ? "" : role,
            'assets/images/lawyer.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          LawyerCard(
            name == null ? "" : name,
            role == null ? "" : role,
            'assets/images/lawyer1.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          LawyerCard(
            name == null ? "" : name,
            role == null ? "" : role,
            'assets/images/lawyer3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
