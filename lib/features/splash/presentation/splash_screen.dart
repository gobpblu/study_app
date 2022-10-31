import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.grey,
                Colors.white12!,
                Colors.grey,
                Colors.black,
              ]
          )
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Выучи новое слово', style: GoogleFonts.abel(
                textStyle: TextStyle(fontSize: 24)
              )),
              SizedBox(height: 128),
              Text('bear - медведь', style: GoogleFonts.adamina(
                  textStyle: TextStyle(fontSize: 18)
              )),
              Text('[bi@r]'),
            ]
          ),
      ),
    );
  }
}
