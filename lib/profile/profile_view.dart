import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final ProfileState state;
  int weight = 0;
  int age = 0;
  int height = 0;
  String gender = "";

  ProfileView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: true,
          minimum: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź wiek',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź wagę',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź wzrost',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź płeć',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź dolny zakres INR',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wprowadź górny zakres INR',
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
