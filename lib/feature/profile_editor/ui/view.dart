import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/feature/dose_reminder/dose_reminder_setup_tile.dart';
import 'package:apkainzynierka/feature/profile_editor/model/state.dart';
import 'package:apkainzynierka/feature/profile_editor/service/cubit.dart';
import 'package:apkainzynierka/widget/action_button.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ProfileEditorView extends StatelessWidget {
  final ProfileEditorState state;
  final ProfileEditorCubit cubit;

  const ProfileEditorView(
      {super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        child: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(text: "Dane osobowe"),
                  TextFormField(
                    style: const TextStyle(fontSize: 14),
                    initialValue: state.firstName,
                    onChanged: cubit.setFirstName,
                    decoration: const InputDecoration(
                        labelText: "Imię",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        filled: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      initialValue: state.lastName,
                      onChanged: cubit.setLastName,
                      decoration: const InputDecoration(
                          labelText: "Nazwisko",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Header(text: "Parametry ciała"),
                  Row(
                    children: [
                      Expanded(
                        child: IntegerField(
                          label: "Wiek",
                          minValue: 0,
                          maxValue: 130,
                          suffixText: "lata",
                          value: state.age ?? 0,
                          onChanged: (age) {
                            cubit.setAge(age);
                          },
                          error: state.ageError,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: IntegerField(
                          label: "Wzrost",
                          minValue: 0,
                          maxValue: 300,
                          suffixText: "cm",
                          value: state.height ?? 0,
                          onChanged: (value) {
                            cubit.setHeight(value);
                          },
                          error: state.heightError,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: IntegerField(
                          label: "Waga",
                          minValue: 0,
                          maxValue: 300,
                          suffixText: "kg",
                          value: state.weight ?? 0,
                          onChanged: (value) {
                            cubit.setWeight(value);
                          },
                          error: state.weightError,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SelectorField<Gender?>(
                          label: "Płeć",
                          option: state.gender,
                          optionAdapter: _displayGender,
                          options: Gender.values,
                          onChanged: (value) => cubit.setGender(value),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Header(text: "Leczenie"),
                  Row(
                    children: [
                      Expanded(
                        child: SelectorField<Illness?>(
                          label: "Dolegliwość",
                          option: state.illness,
                          optionAdapter: _displayIllness,
                          options: Illness.values,
                          onChanged: (value) => cubit.setIllness(value),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SelectorField<Anticoagulant>(
                          label: "Antykoagulant",
                          option: state.anticoagulant,
                          optionAdapter: _displayAnticoagulant,
                          options: Anticoagulant.values,
                          onChanged: (value) => cubit.setAnticoagulant(value!),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  FormField<InrRange>(
                      builder: (field) => GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => PickerDialog<InrRange>(
                                builder: (valueNotifier) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("Dolna granica"),
                                    DecimalNumberPicker(
                                      itemWidth: 50,
                                      minValue: 0,
                                      maxValue: 5,
                                      decimalTextMapper: (numberText) =>
                                          ".$numberText",
                                      onChanged: (value) =>
                                          valueNotifier.value = valueNotifier
                                              .value
                                              .copyWith(from: value),
                                      value: valueNotifier.value.from,
                                    ),
                                    const SizedBox(height: 24),
                                    const Text("Górna granica"),
                                    DecimalNumberPicker(
                                      itemWidth: 50,
                                      minValue: 0,
                                      maxValue: 5,
                                      decimalTextMapper: (numberText) =>
                                          ".$numberText",
                                      onChanged: (value) =>
                                          valueNotifier.value = valueNotifier
                                              .value
                                              .copyWith(to: value),
                                      value: valueNotifier.value.to,
                                    ),
                                  ],
                                ),
                                initialValue: state.inrRange,
                                onSubmitted: (value) =>
                                    cubit.setInrRange(value),
                                onFinished: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            child: InputDecorator(
                                decoration: InputDecoration(
                                    labelText: "Terapeutyczny przedział INR",
                                    errorText: state.inrRangeError,
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    filled: true),
                                child: Text(
                                    "${state.inrRange.from} - ${state.inrRange.to}")),
                          )),
                  const SizedBox(height: 8),
                  OtherMedicinesPicker(state: state, cubit: cubit),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: DoseReminderSetupTile(),
                  ),
                  ActionButton(
                    onPressed: cubit.save,
                    label: "Zapisz",
                    icon: Icons.done,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _displayGender(Gender? gender) {
    switch (gender) {
      case Gender.male:
        return "Mężczyzna";
      case Gender.female:
        return "Kobieta";
      default:
        return "nie podano";
    }
  }

  String _displayIllness(Illness? illness) {
    switch (illness) {
      case Illness.artificialValve:
        return "Sztuczna zastawka";
      case Illness.other:
        return "Inne";
      default:
        return "nie podano";
    }
  }

  String _displayAnticoagulant(Anticoagulant value) {
    switch (value) {
      case Anticoagulant.acenokumarol:
        return "Acenokumarol";
      case Anticoagulant.sintrom:
        return "Sintrom";
      case Anticoagulant.warfin:
        return "Warfarin";
      default:
        return "nie podano";
    }
  }
}

class Header extends StatelessWidget {
  final String text;

  const Header({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class OtherMedicinesPicker extends StatefulWidget {
  const OtherMedicinesPicker({
    Key? key,
    required this.state,
    required this.cubit,
  }) : super(key: key);

  final ProfileEditorState state;
  final ProfileEditorCubit cubit;

  @override
  State<OtherMedicinesPicker> createState() => _OtherMedicinesPickerState();
}

class _OtherMedicinesPickerState extends State<OtherMedicinesPicker> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
            labelText: "Przyjmowane leki",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            filled: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
                spacing: 6,
                children: widget.state.otherMedicines
                    .map((e) => Chip(
                          label: Text(e),
                          backgroundColor: Colors.blue,
                        ))
                    .toList()),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  onSubmitted: (value) => submitNewMedicine(),
                  decoration:
                      const InputDecoration(helperText: "Wprowadź nowy lek"),
                )),
                IconButton(
                    onPressed: submitNewMedicine, icon: const Icon(Icons.add))
              ],
            )
          ],
        ));
  }

  void submitNewMedicine() {
    widget.cubit.addOtherMedicine(_controller.text);
    _controller.clear();
  }
}

class IntegerField extends StatelessWidget {
  final void Function(int value) onChanged;
  final int value;
  final String? error;
  final int minValue;
  final int maxValue;
  final String label;
  final String? suffixText;

  const IntegerField(
      {super.key,
      required this.onChanged,
      required this.value,
      this.error,
      required this.minValue,
      required this.maxValue,
      required this.label,
      this.suffixText});

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
        builder: (field) => GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => PickerDialog(
                    builder: (valueNotifier) => NumberPicker(
                      infiniteLoop: true,
                      minValue: minValue,
                      maxValue: maxValue,
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
                      labelText: label,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      suffixText: suffixText),
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
  final Widget Function(ValueNotifier<T> valueNotifier) builder;
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

class SelectorField<T> extends StatelessWidget {
  final List<T> options;
  final T option;
  final String Function(T value) optionAdapter;
  final String label;
  final void Function(T? value) onChanged;

  const SelectorField(
      {super.key,
      required this.options,
      required this.option,
      required this.optionAdapter,
      required this.label,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: option,
      onChanged: onChanged,
      autofocus: false,
      items: options
          .map((e) => DropdownMenuItem<T>(
                value: e,
                child: Text(
                  optionAdapter(e),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ))
          .toList(),
      decoration: InputDecoration(
          labelText: label,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          filled: true),
    );
  }
}
