import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle movieTitleStyle = GoogleFonts.poppins(
      fontSize: 17.sp,fontWeight: FontWeight.w400);
  static TextStyle movieDetailsTitleStyle = GoogleFonts.poppins(
      fontSize: 25.sp, fontWeight: FontWeight.bold);
  static TextStyle categoryTitleStyle = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.bold);
  static TextStyle movieDescriptionStyle =
      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey);
  static TextStyle movieTitleInListStyle =
      GoogleFonts.poppins(fontSize: 15.sp);
  static TextStyle dateStyle =
      GoogleFonts.poppins(fontSize: 12.sp);
}
