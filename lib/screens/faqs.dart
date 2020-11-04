
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheria_legal/models/faqs_model.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FaQs'),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionsAnswers.length,
          itemBuilder: (_, index) {
            return ExpansionTile(
              title: Text(
                DataSource.questionsAnswers[index]['question'],
                style: GoogleFonts.mcLaren(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(DataSource.questionsAnswers[index]['answer']),
                ),
              ],
            );
          }),
    );
  }
}
