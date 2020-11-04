import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/screens/appointments.dart';

class Commercial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness:Brightness.dark),
          home: Scaffold(
        appBar: AppBar(
          title: Text('Commercial Law'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 12.0),
                child: Text(
                  'Commercial Lawyer',
                  style:
                      GoogleFonts.mcLaren(fontSize: 24.0,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Commercial lawyers are attorneys who specialize in business law. They might work on negotiating and drafting contracts, reviewing employment agreements or company mergers. Some commercial lawyers work for a law firm and represent many clients, while others are employed by a company and represent its legal interests exclusively. Like all attorneys, commercial lawyers must hold a law degree, which usually requires three years of post-baccalaureate study, and pass their state\'s bar exam for licensure.',
                  style: GoogleFonts.mcLaren(fontSize: 18.0,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: RaisedButton(
                    child: Text(
                      'Book appointment'.toUpperCase(),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Appointments()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
