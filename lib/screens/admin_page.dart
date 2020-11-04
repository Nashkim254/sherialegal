
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/screens/add_lawyer.dart';
import 'package:sheria_legal/screens/view_appointments.dart';
import 'package:sheria_legal/screens/view_feeds.dart';
import 'package:sheria_legal/screens/view_lawyers.dart';
import 'package:sheria_legal/widgets/constants.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              margin: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnboardingScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.group_add,
                        size: 70.0,
                        color: Colors.green,
                      ),
                      Text(
                        'Add Lawyer',
                        style: GoogleFonts.mcLaren(
                          fontSize: 17.0,
                          color: kYellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(top:18.0,bottom: 14.0,left: 18.0,right: 18.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewAppoints()));
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.library_books,
                        size: 70.0,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        'View\nAppointments',
                        style: GoogleFonts.mcLaren(
                          fontSize: 14.0,
                          color: kYellowColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewFeeds()));
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.feedback,
                        size: 70.0,
                        color: Colors.lightBlueAccent,
                      ),
                      Text(
                        'Feedback',
                        style: GoogleFonts.mcLaren(
                          fontSize: 17.0,
                          color: kYellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
              Card(
              margin: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewLaw()));
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 70.0,
                        color: Colors.lime,
                      ),
                      Text(
                        'View Lawyers',
                        style: GoogleFonts.mcLaren(
                          fontSize: 14.0,
                          color: kYellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
