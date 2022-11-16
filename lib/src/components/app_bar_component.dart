import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarComp extends StatelessWidget {
  const CustomAppBarComp({
    super.key,
    required this.body,
    this.showHomeButton = true,
  });

  final Widget body;
  final bool showHomeButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jogo de memória',
              style: GoogleFonts.pacifico(
                fontSize: 36,
              ),
            ),
            Visibility(
              visible: showHomeButton,
              replacement: const Text(''),
              child: TextButton.icon(
                onPressed: () => context.go('/dashboard'),
                icon: const Icon(
                  Icons.home,
                  size: 56,
                  color: Colors.white,
                ),
                label: const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
