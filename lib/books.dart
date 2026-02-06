//  LARA'S FORM CODE ===========================================

import 'package:flutter/material.dart';

// REMOVE as it is not the homepage now
// void main() {
//   runApp(const MyApp());
// }

// remove MyApp build
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static const Color sageGreen = Color(0xFFA3D2A8);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(backgroundColor: sageGreen),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create a new Review'),
//           centerTitle: true,
//         ),
//         body: const Padding(padding: EdgeInsets.all(16.0), child: MyForm()),
//       ),
//     );
//   }
// }

// change MyForm to Books
class Books extends StatefulWidget {
  const Books({super.key});

  static const Color sageGreen = Color(0xFFA3D2A8);
  @override
  BookState createState() => BookState();
  }


//define state class --> holds data related to form
class BookState extends State<Books> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _bookTitleController =
      TextEditingController(); //this sees the text changes in input
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  // DateTime? _dateStarted;
  // DateTime? _dateFinished;

  @override
  void dispose() {
    _bookTitleController.dispose();
    _authorController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

// added this as link would not work if not in a scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Review Form'),
        backgroundColor: Books.sageGreen,
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(16.0),          
              
    //build a form widget using _formKey
          child: Form(
            key: _formKey,
        child: SizedBox(
          height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            TextFormField(
              controller: _bookTitleController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.book),
                labelText: "Book Title",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Author",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _reviewController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.comment),
                labelText: "Review",
                border: OutlineInputBorder(),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            // FormField<DateTime>(
            //   validator: (value) {
            //     if (value == null) return 'Please select a date';
            //     return null;
            //   },
            //   builder: (fieldState) {
            //     //nop controller because it saves itself
            //     return InputDatePickerFormField(
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime.now(),
            //       initialDate: DateTime.now(),
            //       fieldLabelText: 'Date started',
            //       onDateSaved: (date) {
            //         _dateStarted = date;
            //         fieldState.didChange(date);
            //       },
            //     );
            //   },
            // ),
            // FormField<DateTime>(
            //   validator: (value) {
            //     if (value == null) return 'Please select a date';
            //     return null;
            //   },
            //   builder: (fieldState) {
            //     //nop controller because it saves itself
            //     return InputDatePickerFormField(
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime.now(),
            //       initialDate: DateTime.now(),
            //       fieldLabelText: 'Date Finished',
            //       onDateSaved: (date) {
            //         _dateFinished = date;
            //         fieldState.didChange(date);
            //       },
            //     );
            //   },
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Books.sageGreen),
              
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  debugPrint(
                    'Book title: ${_bookTitleController.text}, Author: ${_authorController.text}, Review: ${_reviewController.text}',
                  );

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              
              child: const Text('Submit'),
            ),
                
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);   // 👈 go BACK
                },
                child: const Text('Back to Main Form'),
              ),
          ],
        ),
      ),
    ),
    ),
    );
}
}