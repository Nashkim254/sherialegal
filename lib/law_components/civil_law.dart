import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/screens/appointments.dart';

class Civil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness:Brightness.dark),
          home: Scaffold(
        appBar: AppBar(
          title: Text('Civil Law'),
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
                  'Civil Lawyer',
                  style:
                      GoogleFonts.mcLaren(fontSize: 24.0,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Technically, all areas of law already mentioned on this list may also be considered civil litigation cases. This is why a civil litigation lawyer is regarded as a general lawyer. However, their primary work comprises handling cases involving a breach of contract. While this may seem simple compared to other areas of law, contract disputes can be a tedious process. So, it will pay to hire an excellent civil litigation attorney who can easily spot the finer details of the case.',
                  style: GoogleFonts.mcLaren(fontSize: 18.0),
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
