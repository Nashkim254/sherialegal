import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/screens/appointments.dart';

class Family extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Family Law'),
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
                  'Family Lawyer',
                  style: GoogleFonts.mcLaren(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'These are lawyers who handle all kinds of domestic cases, such as divorce, legal separation, child custody, adoption, paternity, alimony, prenuptial or postnuptial agreements, and emancipation. But family attorneys may also handle reproductive rights cases, and their work may intersect with other areas of the law. For instance, if there’s a criminal investigation of child abuse or a domestic violence case, or if there’s a juvenile delinquency case, a family lawyer may also work with a criminal lawyer.',
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
