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
                  builder: (context) => PickerDialog(
                    builder: (valueNotifier) => NumberPicker(
                      minValue: 0,
                      maxValue: 130,
                      onChanged: (value) => valueNotifier.value = value,
                      value: valueNotifier.value,
                    ),
                    initialValue: value,
                    onSubmitted: onChanged,
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

class PickerDialog<T> extends StatelessWidget {
  PickerDialog(
      {super.key,
      required this.onSubmitted,
      required this.onFinished,
      required this.builder,
      required this.initialValue});

  final void Function(T value) onSubmitted;
  final void Function() onFinished;
  final Widget Function(ValueNotifier valueNotifier) builder;
  final T initialValue;
  late final ValueNotifier<T> _valueNotifier = ValueNotifier(initialValue);

  @override
  Widget build(BuildContext context) {
    return ValuePromptDialog(
        content: ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (context, value, child) => builder(_valueNotifier)),
        onSubmitted: () {
          onSubmitted(_valueNotifier.value);
        },
        onFinished: () {
          onFinished();
        });
  }
}

class ValuePromptDialog extends StatelessWidget {
  final Widget content;
  final void Function() onSubmitted;
  final void Function() onFinished;

  const ValuePromptDialog(
      {super.key,
      required this.content,
      required this.onSubmitted,
      required this.onFinished});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: content,
      actions: [
        TextButton(onPressed: () => onFinished(), child: const Text("Anuluj")),
        TextButton(
            onPressed: () {
              onSubmitted();
              onFinished();
            },
            child: const Text("OK"))
      ],
    );
  }
}
