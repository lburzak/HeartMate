import 'package:apkainzynierka/feature/profile_editor/model/state.dart';
import 'package:apkainzynierka/feature/profile_editor/service/cubit.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ProfileEditorView extends StatelessWidget {
  final ProfileEditorState state;
  final ProfileEditorCubit cubit;

  const ProfileEditorView(
      {super.key, required this.state, required this.cubit});

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
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AgeField(
                        value: state.age ?? 0,
                        onChanged: (age) {
                          cubit.setAge(age);
                        },
                        error: state.ageError,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AgeField(
                      value: state.age ?? 0,
                      onChanged: (age) {
                        cubit.setAge(age);
                      },
                      error: state.ageError,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AgeField(
                        value: state.age ?? 0,
                        onChanged: (age) {
                          cubit.setAge(age);
                        },
                        error: state.ageError,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AgeField(
                      value: state.age ?? 0,
                      onChanged: (age) {
                        cubit.setAge(age);
                      },
                      error: state.ageError,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AgeField extends StatelessWidget {
  final void Function(int value) onChanged;
  final int value;
  final String? error;

  const AgeField(
      {super.key, required this.onChanged, required this.value, this.error});

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
        builder: (field) => GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AgePicker(
                    onSubmitted: onChanged,
                    age: value,
                    onFinished: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              child: InputDecorator(
                  decoration: InputDecoration(
                      errorText: error,
                      labelText: "Wiek",
                      border: const UnderlineInputBorder(),
                      filled: true,
                      suffixText: "lata"),
                  child: Text(value.toString())),
            ));
  }
}

class AgePicker extends StatefulWidget {
  const AgePicker(
      {super.key,
      required this.onSubmitted,
      required this.age,
      required this.onFinished});

  final void Function(int age) onSubmitted;
  final void Function() onFinished;
  final int age;

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  late int selectedAge;

  @override
  void initState() {
    super.initState();
    selectedAge = widget.age;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: NumberPicker(
        minValue: 0,
        maxValue: 130,
        onChanged: (value) {
          setState(() {
            selectedAge = value;
          });
        },
        value: selectedAge,
      ),
      actions: [
        TextButton(
            onPressed: () => widget.onFinished(), child: const Text("Anuluj")),
        TextButton(
            onPressed: () {
              widget.onSubmitted(selectedAge);
              widget.onFinished();
            },
            child: const Text("OK"))
      ],
    );
  }
}
