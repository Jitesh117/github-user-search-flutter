import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FocusedText extends StatelessWidget {
  const FocusedText({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description,
          style: GoogleFonts.spaceMono(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade500,
          )),
        ),
        Text(
          value,
          style: GoogleFonts.spaceMono(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
