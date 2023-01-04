import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/cubit.dart';
import 'package:flutter/material.dart';

class ScheduleWizardView extends StatelessWidget {
  final ScheduleWizardState state;
  final ScheduleWizardCubit cubit;

  const ScheduleWizardView(
      {super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(child: Text("Nowy harmonogram")),
        _CalendarField(
          dateTime: state.startDate,
          onDateSelected: (DateTime selectedDate) {
            print(selectedDate.day);
          },
        ),
        _CalendarField(
          dateTime: state.endDate,
          onDateSelected: (DateTime selectedDate) {
            print(selectedDate);
          },
        ),
        _ScheduleTypeSelector(
          selectedType: state.scheduleType,
          onTypeSelected: (type) => cubit.setScheduleType(type!),
        ),
        state.scheduleType == ScheduleType.weekly
            ? Row(
                children: [
                  const SizedBox(width: 20),
                  SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            7,
                            (index) => Row(children: [
                                  const Text("dzień tygodnia"),
                                  const SizedBox(width: 50),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                      onPressed: () =>
                                          cubit.decrementDosage(index),
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text("${state.dosages[index]} mg"),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                      onPressed: () =>
                                          cubit.incrementDosage(index),
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  )
                                ]))),
                  )),
                ],
              )
            : Row(
                children: [
                  const SizedBox(width: 20),
                  const Text("Codziennie"),
                  const SizedBox(width: 50),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      onPressed: () => cubit.decrementDosage(0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text("${state.dosages[0]} mg"),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      onPressed: () => cubit.incrementDosage(0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                  label: const Text("zapisz"))),
        ))
      ],
    );
  }
}

class _ScheduleTypeSelector extends StatelessWidget {
  final ScheduleType selectedType;
  final void Function(ScheduleType? type) onTypeSelected;

  const _ScheduleTypeSelector({
    Key? key,
    required this.selectedType,
    required this.onTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ScheduleTypeOption(
          scheduleType: ScheduleType.daily,
          selectedScheduleType: selectedType,
          onChanged: onTypeSelected,
        ),
        _ScheduleTypeOption(
          scheduleType: ScheduleType.weekly,
          selectedScheduleType: selectedType,
          onChanged: onTypeSelected,
        ),
      ],
    );
  }
}

class _ScheduleTypeOption extends StatelessWidget {
  final ScheduleType scheduleType;
  final ScheduleType selectedScheduleType;
  final void Function(ScheduleType? value) onChanged;

  const _ScheduleTypeOption({
    Key? key,
    required this.scheduleType,
    required this.selectedScheduleType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _createTitle(),
      subtitle: _createDescription(),
      leading: Radio<ScheduleType>(
        value: scheduleType,
        groupValue: selectedScheduleType,
        onChanged: onChanged,
      ),
    );
  }

  Widget _createTitle() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return const Text("Cykl dzienny");
      case ScheduleType.weekly:
        return const Text("Cykl tygodniowy");
    }
  }

  Widget _createDescription() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return const Text("Przyjmujesz taką samą dawkę każdego dnia");
      case ScheduleType.weekly:
        return const Text("Określ dawkę dla każdego dnia tygodnia");
    }
  }
}

class _CalendarField extends StatelessWidget {
  final DateTime dateTime;
  final void Function(DateTime selectedDate) onDateSelected;

  const _CalendarField({
    Key? key,
    required this.dateTime,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(dateTime.toString()),
        onPressed: () {
          onDateSelected(DateTime.now());
        });
  }
}
