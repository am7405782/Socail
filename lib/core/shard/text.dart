import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StyleText {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const title16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle30 = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  static TextStyle textStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle42 = TextStyle(
    color: Colors.white,
    fontSize: 42,
    height: 1,
    fontWeight: FontWeight.bold,
  );
}
