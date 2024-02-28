import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle movieTitleStyle = GoogleFonts.poppins(
      fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w400);
  static TextStyle movieDetailsTitleStyle = GoogleFonts.poppins(
      fontSize: 25.sp, color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle movieDescriptionStyle =
      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey);
  static TextStyle movieTitleInListStyle =
      GoogleFonts.poppins(fontSize: 15.sp, color: Colors.white);
  static TextStyle dateStyle =
      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.white);
}
