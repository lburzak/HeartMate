import 'package:apkainzynierka/profile/model/gender.dart';
import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:apkainzynierka/profile/profile_lang.dart';
import 'package:apkainzynierka/profile/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  final ProfileState state;
  final List<Gender?> genderList = [null, Gender.male, Gender.female];

  ProfileView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final ProfileLang lang = context.read<ProfileLang>();
    final ProfileCubit cubit = context.read<ProfileCubit>();

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
                  onChanged: (text) => cubit.setAge(text),
                  decoration: InputDecoration(
                    hintText: 'Wprowadź wiek',
                    errorText: state.ageError,
                    border: const UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) => cubit.setWeight(text),
                  decoration: InputDecoration(
                    hintText: 'Wprowadź wagę',
                    errorText: state.weightError,
                    border: const UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) => cubit.setHeight(text),
                  decoration: InputDecoration(
                    hintText: 'Wprowadź wzrost',
                    errorText: state.heightError,
                    border: const UnderlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text("Wybierz płeć: "),
                    DropdownButton<String>(
                      value: lang.displayGender(state.gender),
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? value) =>
                          cubit.setGender(lang.readGender(value)),
                      items: genderList
                          .map((gender) => lang.displayGender(gender))
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
                Row(
                  children: [
                    const Text("Wybierz lek: "),
                    DropdownButton<String>(
                      value: state.selectedMedicine,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? value) => cubit.selectMedicine(value),
                      items: state.availableMedicines
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => cubit.save(), child: const Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
