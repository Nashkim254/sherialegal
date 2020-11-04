import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/widgets/constants.dart';

class OnboardingScreen extends StatefulWidget {

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
final DocumentReference documentReference  = FirebaseFirestore.instance.doc("law/mylawyer");
  TextEditingController  aboutController = TextEditingController();
  TextEditingController  nameController = TextEditingController();
  TextEditingController  roleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void _addDoc(){
    Map<String,String> docdata = <String,String>{
      "about": aboutController.text,
      "name": nameController.text,
      "role": roleController.text,
      "time": timeController.text,
    };
    documentReference.set(docdata).whenComplete((){
      print('lawyer added');
    }).catchError((e){
      print(e);
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
          title: Text('Add Lawyer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
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
                        maxLines: 5,
                          controller: aboutController,
                          decoration: InputDecoration(
                            labelText: 'About',
                            hintText: 'Enter about here',
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
                            labelText: 'Name',
                            hintText: 'Advocate Myles',
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
                      SizedBox(height:10.0),
                      TextFormField(
                          controller: roleController,
                          decoration: InputDecoration(
                            labelText: 'Role',
                            hintText: 'Civil law',
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
                            labelText: 'Time',
                            hintText: 'Availbale time',
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
                            _addDoc();
                            showMessage(context);
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
                          'Add Lawyer',
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
  void showMessage(_){
  var alertDialog = AlertDialog(
      title: Text('Alert'),
      content: Text('Added succesfully!'),
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
      ],
    );
    showDialog(context: context,
    builder: (BuildContext context){
      return alertDialog;
    }
    );
  }
}
