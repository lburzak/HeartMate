import 'package:apkainzynierka/profile/gender.dart';
import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  final ProfileState state;
  final List<String> genderList = <String>['mężczyzna', 'kobieta'];
  int weight = 0;
  int age = 0;
  int height = 0;
  String gender = "";
  String? dropdownValue;

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    context.read<ProfileCubit>().setAge(int.parse(text));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź wiek',
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    context.read<ProfileCubit>().setWeight(int.parse(text));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź wagę',
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    context.read<ProfileCubit>().setHeight(int.parse(text));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź wzrost',
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text("Wybierz płeć: "),
                    DropdownButton<String>(
                      value: context.select((ProfileCubit cubit) =>
                          cubit.state.gender == Gender.male
                              ? "mężczyzna"
                              : "kobieta"),
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? value) {
                        context.read<ProfileCubit>().setGender(
                            value == "mężczyzna" ? Gender.male : Gender.female);
                      },
                      items: genderList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź dolny zakres INR',
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź górny zakres INR',
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context.read<ProfileCubit>().save();
                    },
                    child: const Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
