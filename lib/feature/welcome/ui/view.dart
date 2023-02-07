import 'package:apkainzynierka/feature/welcome/service/cubit.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeCubit cubit;

  const WelcomeView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Witaj!",
                style: TextStyle(fontSize: 32.0),
              ),
              const Text(
                "Przed rozpoczęciem korzystania z aplikacji uzupełnij swój profil.",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.info_outline,
                        size: 16,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Ustawienia profilu możesz edytować w dowolnej chwili w zakładce \"Profil\".",
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 36, bottom: 36),
                  child: IconButton(
                      color: Colors.blue,
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 32,
                      ),
                      onPressed: cubit.onNext),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
