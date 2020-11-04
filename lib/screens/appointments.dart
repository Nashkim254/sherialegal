import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/widgets/constants.dart';

class Appointments extends StatefulWidget {

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
final DocumentReference documentReference  = FirebaseFirestore.instance.doc("appointments/myAppointments");
  TextEditingController  aboutController = TextEditingController();
  TextEditingController  nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void _addLaw(){
    Map<String,String> docdata = <String,String>{
      "about": aboutController.text,
      "name": nameController.text,
      "time": timeController.text,
    };
    documentReference.set(docdata).whenComplete((){
      print('appointment added');
    }).catchError((e){
      print(e);
    });
  }
  void alert(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text('Appointment'),
        content: Text('submited successfully!'),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness:Brightness.dark,
        textTheme:GoogleFonts.mcLarenTextTheme(),
      ),
          home: Scaffold(
        appBar: AppBar(
          title: Text('Add Appointment'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            children: <Widget>[
             
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:20.0),
                      TextFormField(
                          controller: aboutController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'eg Appointment',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: kTitleTextColor.withOpacity(0.7),
                          ),
                        ),
                      SizedBox(height:10.0), TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Advocate name',
                            hintText: 'Advocate name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: kTitleTextColor.withOpacity(0.7),
                          ),
                        ),
                      
                      SizedBox(height:10.0), TextFormField(
                          controller: timeController,
                          decoration: InputDecoration(
                            labelText: 'Consultation time',
                            hintText: 'time for consultation',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: kTitleTextColor.withOpacity(0.7),
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        key: const ValueKey("addButton"),
                        onPressed: () {
                          if(nameController.text != ""){
                            _addLaw();
                            alert(context);
                          }
                        },
                        color: kOrangeColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             
            ],
          ),
        ),
      ),
    );
  }
}
