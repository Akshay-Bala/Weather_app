import 'package:flutter/material.dart';
import 'package:weather/weather/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes: {
      "New":(context)=> Screeen1()

      },
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'New',
      //home: //Sample(),
      //Work(),
      //Gridview(),
      debugShowCheckedModeBanner: false,
    );
  }
}

