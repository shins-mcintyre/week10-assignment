# Flutter 

In this document you will find some introductory information about Flutter:
- what it does
- how it works
- how the code is structured, and 
- how it differs from other frameworks

We have also included a demo for building a form with Flutter, where we highlight the differences in creating forms with JavaScript.

## What is Flutter?
Flutter is an SDK which allows you to code for any screen size or device type in one place, without the need for building different codebases. That means you can write code once, and run it on phones, tablets, web browsers and desktops. Flutter code can be released in the exact same way for:
- Android
- iOS
- MacOS
- Windows
- Linux
- Web

### How does Flutter work?
You can create Flutter apps either on a Mac, PC or with Dartpad (an online coding tool)

### Flutter code structure
Flutter uses Dart as a programming language - this is an object-oriented language.

Applications are built using widgets - there is a large library of [pre-built widgets](https://docs.flutter.dev/ui/widgets). Widgets define how the content of the page looks and how it interacts with the user - they are the building blocks of a Flutter app.

<!-- !Add a link here to a widget section in the readme -->
Widgets are created by calling their constructors with parameters defining their content. See more in the 'Widgets & Building an App' section

You can have Flutter apps look the same across platforms, or you can alter what widgets are used depending on the target platform

### Flutter vs other frameworks
How is Flutter different to other SDKs?

#### No CSS
Unlike html/React/Next.js, there is no CSS for styling in Flutter (Dart). Widgets themselves have some inbuilt styling to make them user-friendly, and extra styling can be added within the elements themselves (similar to Tailwind)

#### Hot reload
This feature of Dart allows for an application to be previewed in milliseconds

#### Screen view
Can view how page looks on different device screens, and even shows/integrates with native functionality on those devices (e.g. keyboard on phone)

#### Coding quirks 
- Errors when typing - get in the way of viewing code!
- Auto-fill while coding - sometimes helpful, often annoying
- Suggestion dropdown - helpful to see options

## Widgets & Building an App

### Widget Basics

#### Text & TextStyling
``` Text(
    'Hello, world!',
    style: TextStyle(color: Colors.red, fontSize: 24)
  );
```

#### Icons
You can create an icon using [Google's list of icons](https://fonts.google.com/icons)
```const myIcon = Icon(
  Icons.check,
  color: Colors.green,
  size: 100.0,
);
```

#### Layouts
Layout widgets are used to control how child (or children) widgets are laid out visually - single-child layout widgets organise one widget, while multi-child layout widgets organise several

Types of layout widgets include:
- Center
- Align
- Row
- Column

#### Containers
Container widgets wrap a container box around a child widget - they are useful for adding borders, colours and spacing to the layout of the app

### Basics to building a Flutter app
#### Overview on layout:
```
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold()
    )
  );
}
```
This will show an empty (white) screen → shows it is working
#### void
#### @override
* Flutter is object oriented, objects have methods.
* When you fulfil a method, it is best practice to use @‌override: When you provide your own implementation of a method that is already defined in a parent class, it is best practice to use @override.
*Example:
```
class MyCustomForm extends StatefulWidget { const MyCustomForm({super.key});

@override State<MyCustomForm> createState() => _MyCustomFormState(); }
```
* Flutter is object-oriented, and classes define methods. MyCustomForm extends StatefulWidget, which means it inherits methods from StatefulWidget. (StatefulWidget is the superclass and MyCustomForm is the subclass because it extends StatefulWidget) StatefulWidget already defines a createState() method. When we create MyCustomForm, we override createState() to provide our own implementation that returns _MyCustomFormState. We use @override to explicitly indicate that this method already exists on the parent class and that we are intentionally replacing its implementation.

#### dispose
```
void dispose() {
// Clean up the controller.
formController.dispose(); 
super.dispose(); } //allows Flutter to carry out normal dispose actions, as well as our specific dispose.
```
* The object myController holds resources (state that remembers the text field’s content and listeners for text changes). Without calling dispose() method on this object, it will never stop holding the resources. Even if the widget was removed from the page (say, after submitting a form), the resources would remain which is a waste of memory etc and could make your site/app slow. (memory leak)

#### scaffold
#### body
#### children
etc.

## Demo - Building a form
### form widgets
have properties:
* key (identifies the form) - used to interact with the form (validate/reset/save state)
* child (contains form fields) - usually column or list
* autovalidateMode - enum that specifies when the form should automatically validate its fields

and have methods:
* validate() - returns true if all fields are valid
* save() - save current values (usually after successful validation)
* reset() - resets to initial state (clears user-entered data)
* currentState - returns current FormState

How to build a form:
* Create basic structure with AppBar and body Scaffold
* Initialise variables (inside MyFormState)
* Create MyForm Class
* Create _submitForm method - check if it's valid and show alert box

### Working with a database in Flutter
Linking a database with Flutter is quite different than with previous languages we have used. As flutter is entirely client/mobile, there is no secure way to store a service role key, only an anon public key can be used and the database access happens directly in the client.
Because of this, it is pretty much mandatory that you require row level security (RLS) in your database to protect it and choose what a user is able to do. 
RLS tells supabase what anon users can perform what CRUD methods and what auth users can perform what CRUD methods

#### basic syntax of RLS policy:
```
CREATE POLICY policy_name ON table_name
FOR operation
USING (condition);

//example

create policy "public can read instruments"
on public.instruments
for select to anon
using (true);
```
#### Connecting Supabase database to Flutter
Supabase has some easy to follow, well formatted docs on connecting a table with Flutter specifically. I followed them to write the following:
- Create tables and add this line: alter table instruments enable row level security;
- Complete your RLS (see RLS card)
- In you flutter app, open your pubspec.yalm file and add: ```supabase_flutter: ^2.0.0 as a dependency```
- Open ```lib/main.dart``` and edit the main function to initialise Supabase with your project URL and public API (anon) key. (found in project’s connect dialog)
Example code: 
```
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_PUBLISHABLE_KEY',
  );
  runApp(MyApp());
}
```
- Query your database:
Use a FutureBuilder to fetch the data when the home page loads and display the query result in a ```ListView```.
Replace the default ```MyApp``` and ```MyHomePage``` classes with the following code:
```
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client
      .from('instruments')
      .select();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } //Returns a loading circle if data not yet retrieved
          final instruments = snapshot.data!;
          return ListView.builder(
            itemCount: instruments.length,
            itemBuilder: ((context, index) {
              final instrument = instruments[index];
              return ListTile(
                title: Text(instrument['name']),
              );
            }),
          );
        },
      ),
    );
  }
}
```
If you wanted to add more to this page, instead of just viewing data from a table you would need to follow usual Flutter convention and place the FutureBuilder() as a child of a column/row or other layout widget, you could then add other widgets to your layout widgets.

## Resources
How did we learn?
Expected: use documentation

We used multiple sources of documentation for our learning and creation of a form, we have included all links below.
When creating the form I initially tried using some YouTube tutorials but found that they consistently missed out key information. Many assumed a certain level of understanding Dart/Flutter, 
this was unhelpful for my case as it meant I had to try to find other tutorials/documentation to fill in the gaps that I felt were left. They often did not explain why they were adding certain classes/methods etc... so again,
although they were tutorials they were not very in-depth. I decided to move on to text-based documentation. After looking at multiple resources, I thought often did not have explanations- similar to the YouTube videos. 
Lots of the sites had "copy this code" without explaining it, this was not what I required from the tutorials, we were looking to understand the core concepts.
Eventually, I found and followed the official Flutter docs tutorial. 
Overall, I found the documentation to be very clear and concise, they used consistent naming conventions within the code examples and explained it in depth.
I felt other documentation tutorials were lacking, often relied to heavily on the coded examples without explaining the steps. 
As a beginner, the official docs were also very accessible. They had clear sections with large headers and any code was formatted appropriately with good colour contrast.
The docs also linked to other pages within the site for easy user flow, enabling me to expand my learning without leaving the site.
I did find for wider useages of the site, for example looking up a specific method, it was lacking information that I had to go and find in other unofficial sources. 
On the whole, I found this site to be the most useful for building my form as it was beginner friendly, offered extra resources for more advanced Flutter programmers and had clear user flow.

We wanted to research how we would link a database in the future so that we could link a form for a more "real world" use case. For this, I found that Supabase has a section specific to Flutter.
I was able to find a step-by-step tutorial on how to link them, the etiquette and how to query the database. I did not feel I had to find other documentation to support what Supabase covered.
It was laid out in an easy-to-read format, clear steps were marked and explained thoroughly. I feel it would be useful for both beginners and advanced users.
There were two main pages that I used to write my own explanations, this was the Quickstart and the Row Level Security page. Similar to the Flutter docs, I didn't find myself
needing to go to other sources for a more thorough explanation, they were both very helpful for these usecases.

Exceeding: use more than one source of info plus evaluate documentation usability plus provide references eg links for others to follow



