import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLaw extends StatefulWidget {
  @override
  _CallLawState createState() => _CallLawState();
}

class _CallLawState extends State<CallLaw> {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Call Lawyer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            new MaterialButton(
              color: Colors.blue,
              child: new Text("PICK CONTACT"),
              onPressed: () async {
                Contact contact = await _contactPicker.selectContact();
                setState(() {
                  _contact = contact;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            new GestureDetector(
              onTap: () {
                String phone = "tel:" + _contact.toString();
                launch(phone);
              },
              child: Text(
                _contact == null ? 'No contact selected.' : _contact.toString(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Call',
                  hintText: 'Enter no. here:e.g 911',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              controller: textEditingController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            RaisedButton(
                color: Colors.lime,
                child: Text('Call'),
                onPressed: () {
                  call1();
                }),
          ]),
        ),
      ),
    );
  }

  void call1() {
    String phone = "tel:" + textEditingController.text;
    launch(phone);
  }
}
