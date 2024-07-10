import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column todoText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 30,
      ),
      Text(
        'Hello, John.',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
      ),
      Text(
        'This is a daily quote.',
        style: GoogleFonts.montserrat(
          color: Colors.white70,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      Text(
        'You have 10 tasks to do today.',
        style: GoogleFonts.montserrat(
          color: Colors.white70,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
