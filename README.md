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


<!-- ====== WIDGETS & BUILDING AN APP ========= -->

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
);```

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
void
override
dispose
scaffold
body
children
etc.

<!-- DEMO - BUILDING A FORM -->
<!-- DATABASE INFO -->

<!-- RESOURCES LIST -->
<!-- How did we learn? -->
<!-- Expected: use documentation
Exceeding: use more than one source of info plus evaluate documentation usability plus provide references eg links for others to follow
 -->


