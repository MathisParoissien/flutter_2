import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  final message;

  ErrorScreen(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded(child: Size)
          Center(
            child: Text(
              message,
              style: GoogleFonts.roboto(color: Colors.red, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
