import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleComponent extends StatelessWidget {
  const CustomTitleComponent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 36,
      ),
      maxLines: 1,
    );
  }
}
