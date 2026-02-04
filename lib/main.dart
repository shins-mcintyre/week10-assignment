// // web code
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
          
//         // Set the app's primary theme color
//         primarySwatch: Colors.green, 
//       ),
//       title: 'Flutter Form Example',
//       home: MyForm(),
//     );
//   }
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
    
//   // A key for managing the form
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  
//   // Variable to store the entered name
//   String _name = ''; 
  
//   // Variable to store the entered email
//   String _email = ''; 

//   void _submitForm() {
      
//     // Check if the form is valid
//     if (_formKey.currentState!.validate()) {
      
//       // Save the form data
//       _formKey.currentState!.save(); 
      
//       // You can perform actions with the form
//       // data here and extract the details
//       print('Name: $_name'); // Print the name
//       print('Email: $_email'); // Print the email
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Form Example'),
//       ),
//       body: Form(
          
//         // Associate the form key with this Form widget
//         key: _formKey, 
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
                  
//                 // Label for the name field
//                 decoration: InputDecoration(labelText: 'Name'), 
//                 validator: (value) {
                    
//                   // Validation function for the name field
//                   if (value!.isEmpty) {
                      
//                     // Return an error message if the name is empty
//                     return 'Please enter your name.'; 
//                   }
                  
//                   // Return null if the name is valid
//                   return null; 
//                 },
//                 onSaved: (value) {
                    
//                   // Save the entered name
//                   _name = value!; 
//                 },
//               ),
//               TextFormField(
                  
//                 // Label for the email field
//                 decoration: InputDecoration(labelText: 'Email'), 
//                 validator: (value) {
                    
//                   // Validation function for the email field
//                   if (value!.isEmpty) {
                      
//                     // Return an error message if the email is empty
//                     return 'Please enter your email.'; 
//                   }
                  
//                   // You can add more complex validation logic here
//                   return null; // Return null if the email is valid
//                 },
//                 onSaved: (value) {
                    
//                   // Save the entered email
//                   _email = value!; 
//                 },
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
                  
//                 // Call the _submitForm function when
//                 // the button is pressed
//                 onPressed: _submitForm,
                
//                 // Text on the button
//                 child: Text('Submit'), 
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// MY CODE
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set the app's primary colour
        primarySwatch: Colors.lightGreen,
      ),
      title: 'Flutter Form',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
  }

class _MyFormState extends State <MyForm>{

  // initialise variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';

  // add submitForm method
  void _submitForm() {

// Check if the form is valid
if (_formKey.currentState!.validate()) {
    
  // Save the form data
  _formKey.currentState!.save(); 
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          
        // Title of the dialog
        title: Text('Form Submitted'), 
        
        content: Text(
          'Name: $_name\nEmail: $_email',
        ), 
        
        // Display the entered name and email
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(color: Colors.green),
            ), 
            
            // Button to close the dialog
            onPressed: () {
                
              // Close the dialog
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
}

// build form
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        ),
        
        
        body:Form(
          // Associate the form key with this form widget
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    
                    // Label for the name field
                    labelText: 'Name',

                    // Border style for the text field
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreen,
                        width: 2.0,
                        ), 
                        //Border colour when focused
                    ),
                  ),
                  
                  validator: (value){

                    //Validation function for the name field
                    if (value!.isEmpty) {

                      // return an error message if name is empty
                      return 'Please enter your name.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value){

                    // Save the entered name
                    _name = value!;
                  },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:InputDecoration(

                      // Label for email field
                      labelText: 'Email',

                      // Border style for text field
                      border: OutlineInputBorder(),

                      // Border colour when focused
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightGreen,
                          width: 2.0,
                        ),
                      ),
                    ),
                    
                    validator: (value){

                      // validation function for the email field
                      if (value!.isEmpty){

                        // return an error message if email is empty
                        return 'Please enter your email.';
                      }

                      // Return null if email is valid - you can add more complex validation here
                      return null;
                    },
                    onSaved: (value){

                      // save entered email
                      _email = value!;
                    },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        // Button background colour
                        backgroundColor: Colors.lightGreen,

                        // Button text colour
                        foregroundColor: Colors.white,
                      ),
                      
                      // Call the _submitForm function when tthe button is pressed
                      onPressed: _submitForm,

                      // Text on the button
                      child: Text('Submit'),
                      ),
                    ],
                  ),            
          ),
          ),
          );
    }
  }


 