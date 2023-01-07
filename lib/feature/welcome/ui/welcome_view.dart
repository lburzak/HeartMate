import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 360,
              left: 40,
              child: Text(
                "Witaj!",
                style: GoogleFonts.balooDa2(
                  textStyle: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              left: 40,
              child: SizedBox(
                width: 250,
                child: Text(
                  "Przed rozpoczęciem korzystania z aplikacji uzupełnij swój profil.",
                  style: GoogleFonts.balooDa2(
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 215,
              left: 40,
              child: Icon(Icons.info_outline),
            ),
            Positioned(
              bottom: 200,
              left: 80,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Ustawienia profilu możesz edytować w dowolnej chwili w zakładce \"Profil\".",
                  style: GoogleFonts.balooDa2(
                    textStyle: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 40,
              child: IconButton(
                  color: Colors.blue,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => context.go("/profile/editor")),
            ),
          ],
        ));
  }
}
