import 'package:blood_donation_app/screens/add_donor_screen.dart';
import 'package:blood_donation_app/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation_app/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
    "/":(context)=>HomePage(),
    '/add':(context) => AddDonor(),
        '/update':(context) => UpdateDonor()
    },
     initialRoute: "/",
    // home: const HomePage(),
    );
  }
}

