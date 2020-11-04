import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/screens/appointments.dart';

class Criminal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Criminal Law'),
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
                  'Criminal Lawyer',
                  style: GoogleFonts.mcLaren(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'A criminal defense lawyer is skilled in handling all stages of a criminal lawsuit. They provide valuable counsel to their clients from the time they are arrested, through the investigation, charging, arraignment and sentencing. Their work isn\'t quite done if their clients wish to appeal their case. A good criminal defense attorney knows how to navigate the nuances of the law, which allows them to keep their clients out of prison.',
                  style: GoogleFonts.mcLaren(
                    fontSize: 18.0,
                  ),
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
